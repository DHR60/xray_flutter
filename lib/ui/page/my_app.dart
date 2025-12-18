import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xray_flutter/di/app_config_provider.dart';
import 'package:xray_flutter/di/profile_filter_provider.dart';
import 'package:xray_flutter/di/provider.dart';
import 'package:xray_flutter/di/use_case_provider.dart';
import 'package:xray_flutter/domain/core/result.dart';
import 'package:xray_flutter/ui/page/profile_list/profile_list_view.dart';
import 'package:xray_flutter/ui/page/profile_setting/shared/profile_setting_result.dart';
import 'package:xray_flutter/ui/page/profile_setting/vless_setting_widget.dart';
import 'package:xray_flutter/ui/page/setting/setting_widget.dart';
import 'package:xray_flutter/ui/page/sub/sub_list_view.dart';
import 'package:xray_flutter/ui/page/routing/routing_list_widget.dart';
import 'package:xray_flutter/ui/page/sub/sub_setting_result.dart';
import 'package:xray_flutter/ui/page/sub/sub_setting_widget.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final configState = ref.watch(configInitializerProvider);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: configState.when(
        data: (_) => const MyHomePageState(),
        loading: () =>
            const Scaffold(body: Center(child: CircularProgressIndicator())),
        error: (err, stack) =>
            Scaffold(body: Center(child: Text('Load Config Error: $err'))),
      ),
    );
  }
}

class MyHomePageState extends ConsumerStatefulWidget {
  const MyHomePageState({super.key});

  @override
  ConsumerState<MyHomePageState> createState() => _MyHomePageStateState();
}

class _MyHomePageStateState extends ConsumerState<MyHomePageState> {
  bool _isLoading = false;
  bool _isSearching = false;
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: '搜索',
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  ref.read(profileFilterProvider.notifier).updateKeyword(value);
                },
              )
            : const Text('XRay Flutter'),
        actions: [
          if (_isSearching)
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                setState(() {
                  _isSearching = false;
                  _searchController.clear();
                  ref.read(profileFilterProvider.notifier).updateKeyword('');
                });
              },
            )
          else
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                setState(() {
                  _isSearching = true;
                });
              },
            ),
          if (!_isSearching) ...[
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () async {
                final profile = await ref
                    .read(storeServiceProvider)
                    .generateNewProfile();
                if (!context.mounted) return;
                final intent = await Navigator.push<ProfileSettingResult>(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        VlessSettingWidget(profile: profile, isNew: true),
                  ),
                );
                switch (intent) {
                  case ProfileSettingUpsert(profile: final profile):
                    await ref.read(upsertProfileUseCaseProvider).call(profile);
                    break;
                  default:
                    break;
                }
              },
            ),
            PopupMenuButton<String>(
              onSelected: (value) {
                // Handle menu item selection
              },
              itemBuilder: (BuildContext context) {
                return {'Help', 'About'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              child: Center(
                child: Text('Drawer Header', style: TextStyle(fontSize: 24)),
              ),
            ),
            ListTile(
              leading: Icon(Icons.route),
              title: Text('Route Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RoutingListWidget(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingWidget()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: Row(
              children: [
                Expanded(child: SubListView()),
                const VerticalDivider(width: 1),
                PopupMenuButton<String>(
                  onSelected: (value) async {
                    SubSettingResult? intent;
                    switch (value) {
                      case 'Add':
                        intent = await Navigator.push<SubSettingResult>(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubSettingWidget(
                              subItem: ref
                                  .read(appConfigProvider.notifier)
                                  .manager
                                  .generateNewSubItem(),
                              isNew: true,
                            ),
                          ),
                        );
                        break;
                      case 'Edit':
                        intent = await Navigator.push<SubSettingResult>(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubSettingWidget(
                              subItem: ref
                                  .read(storeServiceProvider)
                                  .getCurrentSubItem()!,
                              isNew: false,
                            ),
                          ),
                        );
                        break;
                      case 'Delete':
                        intent = await showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('确认删除'),
                            content: const Text('您确定要删除此子项吗？'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('取消'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(
                                    context,
                                    SubSettingDelete(
                                      ref
                                          .read(storeServiceProvider)
                                          .getCurrentSubItem()!,
                                    ),
                                  );
                                },
                                child: const Text('删除'),
                              ),
                            ],
                          ),
                        );
                        break;
                    }
                    switch (intent) {
                      case SubSettingUpsert(item: final item):
                        await ref
                            .read(storeServiceProvider)
                            .upsertSubItem(item);
                        break;
                      case SubSettingDelete(item: final item):
                        await ref
                            .read(storeServiceProvider)
                            .deleteSub(item.subId);
                        break;
                      case null:
                      case SubSettingNone():
                        break;
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return {'Add', 'Edit', 'Delete'}.map((String choice) {
                      if (choice == 'Edit' || choice == 'Delete') {
                        final currentSubItem = ref
                            .read(storeServiceProvider)
                            .getCurrentSubItem();
                        if (currentSubItem == null ||
                            currentSubItem.subId.isEmpty) {
                          return PopupMenuItem<String>(
                            value: choice,
                            enabled: false,
                            child: Text(
                              choice,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          );
                        }
                      }
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice),
                      );
                    }).toList();
                  },
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(child: ProfileListView()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _isLoading
            ? null
            : () async {
                setState(() {
                  _isLoading = true;
                });
                try {
                  final result = await ref
                      .read(startCoreServiceUseCareProvider)
                      .call();
                  if (result is Success) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(const SnackBar(content: Text('启动服务成功')));
                    }
                  } else if (result is Failure) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('启动服务失败: ${result.error}')),
                      );
                    }
                  }
                } finally {
                  if (mounted) {
                    setState(() {
                      _isLoading = false;
                    });
                  }
                }
              },
        tooltip: 'Start',
        child: _isLoading
            ? const CircularProgressIndicator()
            : const Icon(Icons.flight_takeoff),
      ),
    );
  }
}
