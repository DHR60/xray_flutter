import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_field_editor/json_field_editor.dart';

class JsonEditWidget extends ConsumerStatefulWidget {
  final String title;
  final String initialJson;

  const JsonEditWidget({
    super.key,
    required this.title,
    required this.initialJson,
  });

  @override
  ConsumerState<JsonEditWidget> createState() => _JsonEditWidgetState();
}

class _JsonEditWidgetState extends ConsumerState<JsonEditWidget> {
  late final JsonTextFieldController _jsonController;
  late final UndoHistoryController _undoHistoryController;
  late final ScrollController _toolbarScrollController;
  bool _canScrollLeft = false;
  bool _canScrollRight = false;
  bool _allowPop = false;
  bool _setStateScheduled = false;

  @override
  void initState() {
    super.initState();
    _jsonController = JsonTextFieldController()..text = widget.initialJson;
    _jsonController.addListener(_onJsonChanged);
    _undoHistoryController = UndoHistoryController();
    _toolbarScrollController = ScrollController();
    _toolbarScrollController.addListener(_updateScrollIndicators);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateScrollIndicators();
    });
  }

  void _onJsonChanged() {
    _requestRebuild();
  }

  void _requestRebuild() {
    if (!mounted) return;
    if (_setStateScheduled) return;
    _setStateScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setStateScheduled = false;
      if (mounted) setState(() {});
    });
  }

  void _updateScrollIndicators() {
    if (!_toolbarScrollController.hasClients) return;
    final position = _toolbarScrollController.position;
    setState(() {
      _canScrollLeft = position.pixels > 0;
      _canScrollRight = position.pixels < position.maxScrollExtent;
    });
  }

  @override
  void dispose() {
    _toolbarScrollController.dispose();
    _jsonController.removeListener(_onJsonChanged);
    _jsonController.dispose();
    super.dispose();
  }

  bool get _hasUnsavedChanges => _jsonController.text != widget.initialJson;

  void _saveJson(BuildContext context) {
    Navigator.of(context).pop(_jsonController.text);
  }

  Future<bool> _onWillPop() async {
    if (!_hasUnsavedChanges) return true;

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('未保存的更改'),
        content: const Text('你有未保存的更改，确定要放弃吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('放弃'),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  void insertTextAtCursor(TextEditingController controller, String insertText) {
    final selection = controller.selection;

    if (!selection.isValid) {
      controller.text += insertText;
      controller.selection = TextSelection.collapsed(
        offset: controller.text.length,
      );
      return;
    }

    final newText = controller.text.replaceRange(
      selection.start,
      selection.end,
      insertText,
    );

    final newCursorPosition = selection.start + insertText.length;

    controller.text = newText;
    controller.selection = TextSelection.collapsed(offset: newCursorPosition);
  }

  void insertPairAtCursor(
    TextEditingController controller,
    String openChar,
    String closeChar,
  ) {
    final selection = controller.selection;

    if (!selection.isValid) {
      controller.text += '$openChar$closeChar';
      controller.selection = TextSelection.collapsed(
        offset: controller.text.length - closeChar.length,
      );
      return;
    }

    final newText = controller.text.replaceRange(
      selection.start,
      selection.end,
      '$openChar$closeChar',
    );

    final newCursorPosition = selection.start + openChar.length;

    controller.text = newText;
    controller.selection = TextSelection.collapsed(offset: newCursorPosition);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _allowPop || !_hasUnsavedChanges,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final shouldPop = await _onWillPop();
        if (shouldPop && context.mounted) {
          setState(() {
            _allowPop = true;
          });
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.mounted) {
              Navigator.of(context).pop();
            }
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () => _saveJson(context),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: JsonField(
                  controller: _jsonController,
                  undoController: _undoHistoryController,
                  isFormatting: true,
                  showErrorMessage: false,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  expands: true,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  padding: const EdgeInsets.all(12.0),
                  child: Stack(
                    children: [
                      ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context).copyWith(
                          dragDevices: {
                            PointerDeviceKind.touch,
                            PointerDeviceKind.mouse,
                          },
                        ),
                        child: Scrollbar(
                          controller: _toolbarScrollController,
                          thumbVisibility: true,
                          child: SingleChildScrollView(
                            controller: _toolbarScrollController,
                            scrollDirection: Axis.horizontal,
                            child: IntrinsicHeight(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Row(
                                  children: [
                                    TextButton.icon(
                                      onPressed: () {
                                        _undoHistoryController.undo();
                                      },
                                      icon: const Icon(Icons.undo),
                                      label: const Text('撤销'),
                                    ),
                                    TextButton.icon(
                                      onPressed: () {
                                        _undoHistoryController.redo();
                                      },
                                      icon: const Icon(Icons.redo),
                                      label: const Text('重做'),
                                    ),
                                    TextButton.icon(
                                      onPressed: () {
                                        final txt = _jsonController.text;
                                        final sel = _jsonController.selection;

                                        if (!sel.isValid) {
                                          _jsonController.selection =
                                              TextSelection.collapsed(
                                                offset: txt.length,
                                              );
                                        } else {
                                          int start = sel.start;
                                          int end = sel.end;
                                          if (start < 0) start = 0;
                                          if (end < 0) end = 0;
                                          if (start > txt.length) {
                                            start = txt.length;
                                          }
                                          if (end > txt.length) {
                                            end = txt.length;
                                          }
                                          _jsonController.selection =
                                              TextSelection(
                                                baseOffset: start,
                                                extentOffset: end,
                                              );
                                        }

                                        try {
                                          _jsonController.formatJson(
                                            sortJson: false,
                                          );
                                        } catch (_) {}
                                      },
                                      icon: const Icon(Icons.code),
                                      label: const Text('格式化'),
                                    ),
                                    const VerticalDivider(),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        minimumSize: Size.zero,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 8,
                                        ),
                                      ),
                                      child: const Text('"'),
                                      onPressed: () {
                                        insertTextAtCursor(
                                          _jsonController,
                                          '"',
                                        );
                                      },
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        minimumSize: Size.zero,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 8,
                                        ),
                                      ),
                                      child: const Text(':'),
                                      onPressed: () {
                                        insertTextAtCursor(
                                          _jsonController,
                                          ':',
                                        );
                                      },
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        minimumSize: Size.zero,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 8,
                                        ),
                                      ),
                                      child: const Text(','),
                                      onPressed: () {
                                        insertTextAtCursor(
                                          _jsonController,
                                          ',',
                                        );
                                      },
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        minimumSize: Size.zero,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 8,
                                        ),
                                      ),
                                      child: const Text('{}'),
                                      onPressed: () {
                                        insertPairAtCursor(
                                          _jsonController,
                                          '{',
                                          '}',
                                        );
                                      },
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        minimumSize: Size.zero,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 8,
                                        ),
                                      ),
                                      child: const Text('[]'),
                                      onPressed: () {
                                        insertPairAtCursor(
                                          _jsonController,
                                          '[',
                                          ']',
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // 左侧渐变阴影
                      if (_canScrollLeft)
                        Positioned(
                          left: 0,
                          top: 0,
                          bottom: 0,
                          child: IgnorePointer(
                            child: Container(
                              width: 24,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Theme.of(
                                      context,
                                    ).colorScheme.surfaceContainerHighest,
                                    Theme.of(context)
                                        .colorScheme
                                        .surfaceContainerHighest
                                        .withOpacity(0),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      // 右侧渐变阴影
                      if (_canScrollRight)
                        Positioned(
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: IgnorePointer(
                            child: Container(
                              width: 24,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft,
                                  colors: [
                                    Theme.of(
                                      context,
                                    ).colorScheme.surfaceContainerHighest,
                                    Theme.of(context)
                                        .colorScheme
                                        .surfaceContainerHighest
                                        .withOpacity(0),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
