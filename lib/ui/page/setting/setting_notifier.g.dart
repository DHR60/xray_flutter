// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SettingNotifier)
const settingProvider = SettingNotifierProvider._();

final class SettingNotifierProvider
    extends $NotifierProvider<SettingNotifier, CoreItemDto> {
  const SettingNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingNotifierHash();

  @$internal
  @override
  SettingNotifier create() => SettingNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CoreItemDto value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CoreItemDto>(value),
    );
  }
}

String _$settingNotifierHash() => r'79b635d3b28059915e464028fe273b13fc4baca0';

abstract class _$SettingNotifier extends $Notifier<CoreItemDto> {
  CoreItemDto build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<CoreItemDto, CoreItemDto>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CoreItemDto, CoreItemDto>,
              CoreItemDto,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
