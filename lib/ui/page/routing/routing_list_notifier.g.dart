// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routing_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RoutingListNotifier)
final routingListProvider = RoutingListNotifierProvider._();

final class RoutingListNotifierProvider
    extends $NotifierProvider<RoutingListNotifier, RoutingListState> {
  RoutingListNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routingListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$routingListNotifierHash();

  @$internal
  @override
  RoutingListNotifier create() => RoutingListNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RoutingListState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RoutingListState>(value),
    );
  }
}

String _$routingListNotifierHash() =>
    r'18dd897675c200f2e00d68e9e96cebe6fe8a03af';

abstract class _$RoutingListNotifier extends $Notifier<RoutingListState> {
  RoutingListState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<RoutingListState, RoutingListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RoutingListState, RoutingListState>,
              RoutingListState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
