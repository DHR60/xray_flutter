// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StateItemDto {

 String get subId; String get profileId; String get routingId;
/// Create a copy of StateItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StateItemDtoCopyWith<StateItemDto> get copyWith => _$StateItemDtoCopyWithImpl<StateItemDto>(this as StateItemDto, _$identity);

  /// Serializes this StateItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StateItemDto&&(identical(other.subId, subId) || other.subId == subId)&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.routingId, routingId) || other.routingId == routingId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subId,profileId,routingId);

@override
String toString() {
  return 'StateItemDto(subId: $subId, profileId: $profileId, routingId: $routingId)';
}


}

/// @nodoc
abstract mixin class $StateItemDtoCopyWith<$Res>  {
  factory $StateItemDtoCopyWith(StateItemDto value, $Res Function(StateItemDto) _then) = _$StateItemDtoCopyWithImpl;
@useResult
$Res call({
 String subId, String profileId, String routingId
});




}
/// @nodoc
class _$StateItemDtoCopyWithImpl<$Res>
    implements $StateItemDtoCopyWith<$Res> {
  _$StateItemDtoCopyWithImpl(this._self, this._then);

  final StateItemDto _self;
  final $Res Function(StateItemDto) _then;

/// Create a copy of StateItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subId = null,Object? profileId = null,Object? routingId = null,}) {
  return _then(_self.copyWith(
subId: null == subId ? _self.subId : subId // ignore: cast_nullable_to_non_nullable
as String,profileId: null == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String,routingId: null == routingId ? _self.routingId : routingId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StateItemDto].
extension StateItemDtoPatterns on StateItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StateItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StateItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StateItemDto value)  $default,){
final _that = this;
switch (_that) {
case _StateItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StateItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _StateItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String subId,  String profileId,  String routingId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StateItemDto() when $default != null:
return $default(_that.subId,_that.profileId,_that.routingId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String subId,  String profileId,  String routingId)  $default,) {final _that = this;
switch (_that) {
case _StateItemDto():
return $default(_that.subId,_that.profileId,_that.routingId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String subId,  String profileId,  String routingId)?  $default,) {final _that = this;
switch (_that) {
case _StateItemDto() when $default != null:
return $default(_that.subId,_that.profileId,_that.routingId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StateItemDto implements StateItemDto {
  const _StateItemDto({this.subId = '', this.profileId = '', this.routingId = ''});
  factory _StateItemDto.fromJson(Map<String, dynamic> json) => _$StateItemDtoFromJson(json);

@override@JsonKey() final  String subId;
@override@JsonKey() final  String profileId;
@override@JsonKey() final  String routingId;

/// Create a copy of StateItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StateItemDtoCopyWith<_StateItemDto> get copyWith => __$StateItemDtoCopyWithImpl<_StateItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StateItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateItemDto&&(identical(other.subId, subId) || other.subId == subId)&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.routingId, routingId) || other.routingId == routingId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subId,profileId,routingId);

@override
String toString() {
  return 'StateItemDto(subId: $subId, profileId: $profileId, routingId: $routingId)';
}


}

/// @nodoc
abstract mixin class _$StateItemDtoCopyWith<$Res> implements $StateItemDtoCopyWith<$Res> {
  factory _$StateItemDtoCopyWith(_StateItemDto value, $Res Function(_StateItemDto) _then) = __$StateItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String subId, String profileId, String routingId
});




}
/// @nodoc
class __$StateItemDtoCopyWithImpl<$Res>
    implements _$StateItemDtoCopyWith<$Res> {
  __$StateItemDtoCopyWithImpl(this._self, this._then);

  final _StateItemDto _self;
  final $Res Function(_StateItemDto) _then;

/// Create a copy of StateItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subId = null,Object? profileId = null,Object? routingId = null,}) {
  return _then(_StateItemDto(
subId: null == subId ? _self.subId : subId // ignore: cast_nullable_to_non_nullable
as String,profileId: null == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String,routingId: null == routingId ? _self.routingId : routingId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
