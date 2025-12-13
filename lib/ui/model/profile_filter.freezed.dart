// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileFilter {

 String get keyword; String get subId;
/// Create a copy of ProfileFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileFilterCopyWith<ProfileFilter> get copyWith => _$ProfileFilterCopyWithImpl<ProfileFilter>(this as ProfileFilter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileFilter&&(identical(other.keyword, keyword) || other.keyword == keyword)&&(identical(other.subId, subId) || other.subId == subId));
}


@override
int get hashCode => Object.hash(runtimeType,keyword,subId);

@override
String toString() {
  return 'ProfileFilter(keyword: $keyword, subId: $subId)';
}


}

/// @nodoc
abstract mixin class $ProfileFilterCopyWith<$Res>  {
  factory $ProfileFilterCopyWith(ProfileFilter value, $Res Function(ProfileFilter) _then) = _$ProfileFilterCopyWithImpl;
@useResult
$Res call({
 String keyword, String subId
});




}
/// @nodoc
class _$ProfileFilterCopyWithImpl<$Res>
    implements $ProfileFilterCopyWith<$Res> {
  _$ProfileFilterCopyWithImpl(this._self, this._then);

  final ProfileFilter _self;
  final $Res Function(ProfileFilter) _then;

/// Create a copy of ProfileFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? keyword = null,Object? subId = null,}) {
  return _then(_self.copyWith(
keyword: null == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String,subId: null == subId ? _self.subId : subId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileFilter].
extension ProfileFilterPatterns on ProfileFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileFilter value)  $default,){
final _that = this;
switch (_that) {
case _ProfileFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileFilter value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String keyword,  String subId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileFilter() when $default != null:
return $default(_that.keyword,_that.subId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String keyword,  String subId)  $default,) {final _that = this;
switch (_that) {
case _ProfileFilter():
return $default(_that.keyword,_that.subId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String keyword,  String subId)?  $default,) {final _that = this;
switch (_that) {
case _ProfileFilter() when $default != null:
return $default(_that.keyword,_that.subId);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileFilter implements ProfileFilter {
  const _ProfileFilter({required this.keyword, required this.subId});
  

@override final  String keyword;
@override final  String subId;

/// Create a copy of ProfileFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileFilterCopyWith<_ProfileFilter> get copyWith => __$ProfileFilterCopyWithImpl<_ProfileFilter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileFilter&&(identical(other.keyword, keyword) || other.keyword == keyword)&&(identical(other.subId, subId) || other.subId == subId));
}


@override
int get hashCode => Object.hash(runtimeType,keyword,subId);

@override
String toString() {
  return 'ProfileFilter(keyword: $keyword, subId: $subId)';
}


}

/// @nodoc
abstract mixin class _$ProfileFilterCopyWith<$Res> implements $ProfileFilterCopyWith<$Res> {
  factory _$ProfileFilterCopyWith(_ProfileFilter value, $Res Function(_ProfileFilter) _then) = __$ProfileFilterCopyWithImpl;
@override @useResult
$Res call({
 String keyword, String subId
});




}
/// @nodoc
class __$ProfileFilterCopyWithImpl<$Res>
    implements _$ProfileFilterCopyWith<$Res> {
  __$ProfileFilterCopyWithImpl(this._self, this._then);

  final _ProfileFilter _self;
  final $Res Function(_ProfileFilter) _then;

/// Create a copy of ProfileFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? keyword = null,Object? subId = null,}) {
  return _then(_ProfileFilter(
keyword: null == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String,subId: null == subId ? _self.subId : subId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
