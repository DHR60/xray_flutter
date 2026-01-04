// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routing_setting_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RoutingSettingNotifier)
final routingSettingProvider = RoutingSettingNotifierFamily._();

final class RoutingSettingNotifierProvider
    extends $NotifierProvider<RoutingSettingNotifier, RoutingItemDto> {
  RoutingSettingNotifierProvider._({
    required RoutingSettingNotifierFamily super.from,
    required RoutingItemDto super.argument,
  }) : super(
         retry: null,
         name: r'routingSettingProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$routingSettingNotifierHash();

  @override
  String toString() {
    return r'routingSettingProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  RoutingSettingNotifier create() => RoutingSettingNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RoutingItemDto value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RoutingItemDto>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is RoutingSettingNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$routingSettingNotifierHash() =>
    r'72085b0c75cb5710dcd583e5ae670c4961a817db';

final class RoutingSettingNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          RoutingSettingNotifier,
          RoutingItemDto,
          RoutingItemDto,
          RoutingItemDto,
          RoutingItemDto
        > {
  RoutingSettingNotifierFamily._()
    : super(
        retry: null,
        name: r'routingSettingProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RoutingSettingNotifierProvider call(RoutingItemDto routingItemDto) =>
      RoutingSettingNotifierProvider._(argument: routingItemDto, from: this);

  @override
  String toString() => r'routingSettingProvider';
}

abstract class _$RoutingSettingNotifier extends $Notifier<RoutingItemDto> {
  late final _$args = ref.$arg as RoutingItemDto;
  RoutingItemDto get routingItemDto => _$args;

  RoutingItemDto build(RoutingItemDto routingItemDto);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<RoutingItemDto, RoutingItemDto>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RoutingItemDto, RoutingItemDto>,
              RoutingItemDto,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
