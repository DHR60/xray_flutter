// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SubListNotifier)
const subListProvider = SubListNotifierProvider._();

final class SubListNotifierProvider
    extends $NotifierProvider<SubListNotifier, SubListState> {
  const SubListNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'subListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$subListNotifierHash();

  @$internal
  @override
  SubListNotifier create() => SubListNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SubListState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SubListState>(value),
    );
  }
}

String _$subListNotifierHash() => r'bc4420ab4ac2ee0f048758144b779758fe19b056';

abstract class _$SubListNotifier extends $Notifier<SubListState> {
  SubListState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SubListState, SubListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SubListState, SubListState>,
              SubListState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
