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
        isAutoDispose: false,
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

String _$appDatabaseHash() => r'edefc8d12d0cd187f886975f01ab8b28e1d52352';

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
        isAutoDispose: false,
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

String _$profileRepoHash() => r'c66ef90d83c145a127d2ff122f019870e3c907a9';

@ProviderFor(storeService)
const storeServiceProvider = StoreServiceProvider._();

final class StoreServiceProvider
    extends $FunctionalProvider<StoreService, StoreService, StoreService>
    with $Provider<StoreService> {
  const StoreServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storeServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storeServiceHash();

  @$internal
  @override
  $ProviderElement<StoreService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  StoreService create(Ref ref) {
    return storeService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StoreService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StoreService>(value),
    );
  }
}

String _$storeServiceHash() => r'2179cb250c407b9c32b28e9f4d6157bc404b4beb';
