// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(startCoreService)
const startCoreServiceProvider = StartCoreServiceProvider._();

final class StartCoreServiceProvider
    extends
        $FunctionalProvider<
          StartCoreService,
          StartCoreService,
          StartCoreService
        >
    with $Provider<StartCoreService> {
  const StartCoreServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'startCoreServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$startCoreServiceHash();

  @$internal
  @override
  $ProviderElement<StartCoreService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  StartCoreService create(Ref ref) {
    return startCoreService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StartCoreService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StartCoreService>(value),
    );
  }
}

String _$startCoreServiceHash() => r'a906c30184be07559c51ea177cd5fa9c64f53ce0';

@ProviderFor(coreManager)
const coreManagerProvider = CoreManagerProvider._();

final class CoreManagerProvider
    extends $FunctionalProvider<CoreManager, CoreManager, CoreManager>
    with $Provider<CoreManager> {
  const CoreManagerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'coreManagerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$coreManagerHash();

  @$internal
  @override
  $ProviderElement<CoreManager> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CoreManager create(Ref ref) {
    return coreManager(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CoreManager value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CoreManager>(value),
    );
  }
}

String _$coreManagerHash() => r'127e18a050f82d0cecc11b48589b5de731302a02';

@ProviderFor(coreStatus)
const coreStatusProvider = CoreStatusProvider._();

final class CoreStatusProvider
    extends
        $FunctionalProvider<
          AsyncValue<CoreStatus>,
          CoreStatus,
          Stream<CoreStatus>
        >
    with $FutureModifier<CoreStatus>, $StreamProvider<CoreStatus> {
  const CoreStatusProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'coreStatusProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$coreStatusHash();

  @$internal
  @override
  $StreamProviderElement<CoreStatus> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<CoreStatus> create(Ref ref) {
    return coreStatus(ref);
  }
}

String _$coreStatusHash() => r'badf70cc7593570a571815989a44a170587937ff';
