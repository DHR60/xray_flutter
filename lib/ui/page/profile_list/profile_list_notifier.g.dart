// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Notifier for profile operations (delete, etc.)

@ProviderFor(ProfileListNotifier)
const profileListProvider = ProfileListNotifierProvider._();

/// Notifier for profile operations (delete, etc.)
final class ProfileListNotifierProvider
    extends $NotifierProvider<ProfileListNotifier, ProfileListState> {
  /// Notifier for profile operations (delete, etc.)
  const ProfileListNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileListNotifierHash();

  @$internal
  @override
  ProfileListNotifier create() => ProfileListNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileListState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileListState>(value),
    );
  }
}

String _$profileListNotifierHash() =>
    r'3ed2f346d71f2031d04c495771269bfc5027912c';

/// Notifier for profile operations (delete, etc.)

abstract class _$ProfileListNotifier extends $Notifier<ProfileListState> {
  ProfileListState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ProfileListState, ProfileListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProfileListState, ProfileListState>,
              ProfileListState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
