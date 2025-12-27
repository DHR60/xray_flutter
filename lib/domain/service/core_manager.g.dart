// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

String _$coreStatusHash() => r'6bce49a05ee8723eaf3e1999ffd818115323fa48';
