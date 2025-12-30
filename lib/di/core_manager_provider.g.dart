// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_manager_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(coreStatus)
final coreStatusProvider = CoreStatusProvider._();

final class CoreStatusProvider
    extends
        $FunctionalProvider<
          AsyncValue<CoreStatus>,
          CoreStatus,
          Stream<CoreStatus>
        >
    with $FutureModifier<CoreStatus>, $StreamProvider<CoreStatus> {
  CoreStatusProvider._()
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

String _$coreStatusHash() => r'7f0be532a8d2d7802301dc47ca2ff834090420a1';

@ProviderFor(mainCoreLogOutErr)
final mainCoreLogOutErrProvider = MainCoreLogOutErrProvider._();

final class MainCoreLogOutErrProvider
    extends $FunctionalProvider<AsyncValue<String>, String, Stream<String>>
    with $FutureModifier<String>, $StreamProvider<String> {
  MainCoreLogOutErrProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mainCoreLogOutErrProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mainCoreLogOutErrHash();

  @$internal
  @override
  $StreamProviderElement<String> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<String> create(Ref ref) {
    return mainCoreLogOutErr(ref);
  }
}

String _$mainCoreLogOutErrHash() => r'a6f02cedbc6ccd48f3b4ceec8353d716cd3d217f';
