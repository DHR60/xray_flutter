// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_filter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProfileFilterNotifier)
final profileFilterProvider = ProfileFilterNotifierProvider._();

final class ProfileFilterNotifierProvider
    extends $NotifierProvider<ProfileFilterNotifier, ProfileFilter> {
  ProfileFilterNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileFilterNotifierHash();

  @$internal
  @override
  ProfileFilterNotifier create() => ProfileFilterNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileFilter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileFilter>(value),
    );
  }
}

String _$profileFilterNotifierHash() =>
    r'33091057bed4eaa14564331b5ed3b15d6776b837';

abstract class _$ProfileFilterNotifier extends $Notifier<ProfileFilter> {
  ProfileFilter build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ProfileFilter, ProfileFilter>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProfileFilter, ProfileFilter>,
              ProfileFilter,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
