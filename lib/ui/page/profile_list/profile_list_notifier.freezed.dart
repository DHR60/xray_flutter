// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_list_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileListState {

 String get activeProfileId;
/// Create a copy of ProfileListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileListStateCopyWith<ProfileListState> get copyWith => _$ProfileListStateCopyWithImpl<ProfileListState>(this as ProfileListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileListState&&(identical(other.activeProfileId, activeProfileId) || other.activeProfileId == activeProfileId));
}


@override
int get hashCode => Object.hash(runtimeType,activeProfileId);

@override
String toString() {
  return 'ProfileListState(activeProfileId: $activeProfileId)';
}


}

/// @nodoc
abstract mixin class $ProfileListStateCopyWith<$Res>  {
  factory $ProfileListStateCopyWith(ProfileListState value, $Res Function(ProfileListState) _then) = _$ProfileListStateCopyWithImpl;
@useResult
$Res call({
 String activeProfileId
});




}
/// @nodoc
class _$ProfileListStateCopyWithImpl<$Res>
    implements $ProfileListStateCopyWith<$Res> {
  _$ProfileListStateCopyWithImpl(this._self, this._then);

  final ProfileListState _self;
  final $Res Function(ProfileListState) _then;

/// Create a copy of ProfileListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeProfileId = null,}) {
  return _then(_self.copyWith(
activeProfileId: null == activeProfileId ? _self.activeProfileId : activeProfileId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileListState].
extension ProfileListStatePatterns on ProfileListState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileListState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileListState value)  $default,){
final _that = this;
switch (_that) {
case _ProfileListState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileListState value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileListState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String activeProfileId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileListState() when $default != null:
return $default(_that.activeProfileId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String activeProfileId)  $default,) {final _that = this;
switch (_that) {
case _ProfileListState():
return $default(_that.activeProfileId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String activeProfileId)?  $default,) {final _that = this;
switch (_that) {
case _ProfileListState() when $default != null:
return $default(_that.activeProfileId);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileListState implements ProfileListState {
  const _ProfileListState({required this.activeProfileId});
  

@override final  String activeProfileId;

/// Create a copy of ProfileListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileListStateCopyWith<_ProfileListState> get copyWith => __$ProfileListStateCopyWithImpl<_ProfileListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileListState&&(identical(other.activeProfileId, activeProfileId) || other.activeProfileId == activeProfileId));
}


@override
int get hashCode => Object.hash(runtimeType,activeProfileId);

@override
String toString() {
  return 'ProfileListState(activeProfileId: $activeProfileId)';
}


}

/// @nodoc
abstract mixin class _$ProfileListStateCopyWith<$Res> implements $ProfileListStateCopyWith<$Res> {
  factory _$ProfileListStateCopyWith(_ProfileListState value, $Res Function(_ProfileListState) _then) = __$ProfileListStateCopyWithImpl;
@override @useResult
$Res call({
 String activeProfileId
});




}
/// @nodoc
class __$ProfileListStateCopyWithImpl<$Res>
    implements _$ProfileListStateCopyWith<$Res> {
  __$ProfileListStateCopyWithImpl(this._self, this._then);

  final _ProfileListState _self;
  final $Res Function(_ProfileListState) _then;

/// Create a copy of ProfileListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeProfileId = null,}) {
  return _then(_ProfileListState(
activeProfileId: null == activeProfileId ? _self.activeProfileId : activeProfileId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
