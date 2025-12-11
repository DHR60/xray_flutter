// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appDatabase)
const appDatabaseProvider = AppDatabaseProvider._();

final class AppDatabaseProvider
    extends $FunctionalProvider<AppDatabase, AppDatabase, AppDatabase>
    with $Provider<AppDatabase> {
  const AppDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appDatabaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appDatabaseHash();

  @$internal
  @override
  $ProviderElement<AppDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppDatabase create(Ref ref) {
    return appDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppDatabase>(value),
    );
  }
}

String _$appDatabaseHash() => r'18ce5c8c4d8ddbfe5a7d819d8fb7d5aca76bf416';

@ProviderFor(profileRepo)
const profileRepoProvider = ProfileRepoProvider._();

final class ProfileRepoProvider
    extends $FunctionalProvider<ProfileRepo, ProfileRepo, ProfileRepo>
    with $Provider<ProfileRepo> {
  const ProfileRepoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileRepoHash();

  @$internal
  @override
  $ProviderElement<ProfileRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ProfileRepo create(Ref ref) {
    return profileRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileRepo>(value),
    );
  }
}

String _$profileRepoHash() => r'e310b082aa8b96de5fde4b4186393217dca26d69';

@ProviderFor(appConfigManager)
const appConfigManagerProvider = AppConfigManagerProvider._();

final class AppConfigManagerProvider
    extends
        $FunctionalProvider<
          AppConfigManager,
          AppConfigManager,
          AppConfigManager
        >
    with $Provider<AppConfigManager> {
  const AppConfigManagerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appConfigManagerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appConfigManagerHash();

  @$internal
  @override
  $ProviderElement<AppConfigManager> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppConfigManager create(Ref ref) {
    return appConfigManager(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppConfigManager value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppConfigManager>(value),
    );
  }
}

String _$appConfigManagerHash() => r'0a99d50297287d81ce89ea52970d373799e19aee';

@ProviderFor(configInitializer)
const configInitializerProvider = ConfigInitializerProvider._();

final class ConfigInitializerProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const ConfigInitializerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'configInitializerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$configInitializerHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return configInitializer(ref);
  }
}

String _$configInitializerHash() => r'3481b54a4ad4b85cdf24a1ca524ad7a861a68889';
