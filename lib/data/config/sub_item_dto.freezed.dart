// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubItemDto {

 String get subId; String get subName; int get orderIndex; String? get subUrl; DateTime? get lastUpdated; String? get userAgent; String? get filterRegex;
/// Create a copy of SubItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubItemDtoCopyWith<SubItemDto> get copyWith => _$SubItemDtoCopyWithImpl<SubItemDto>(this as SubItemDto, _$identity);

  /// Serializes this SubItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubItemDto&&(identical(other.subId, subId) || other.subId == subId)&&(identical(other.subName, subName) || other.subName == subName)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.subUrl, subUrl) || other.subUrl == subUrl)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.userAgent, userAgent) || other.userAgent == userAgent)&&(identical(other.filterRegex, filterRegex) || other.filterRegex == filterRegex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subId,subName,orderIndex,subUrl,lastUpdated,userAgent,filterRegex);

@override
String toString() {
  return 'SubItemDto(subId: $subId, subName: $subName, orderIndex: $orderIndex, subUrl: $subUrl, lastUpdated: $lastUpdated, userAgent: $userAgent, filterRegex: $filterRegex)';
}


}

/// @nodoc
abstract mixin class $SubItemDtoCopyWith<$Res>  {
  factory $SubItemDtoCopyWith(SubItemDto value, $Res Function(SubItemDto) _then) = _$SubItemDtoCopyWithImpl;
@useResult
$Res call({
 String subId, String subName, int orderIndex, String? subUrl, DateTime? lastUpdated, String? userAgent, String? filterRegex
});




}
/// @nodoc
class _$SubItemDtoCopyWithImpl<$Res>
    implements $SubItemDtoCopyWith<$Res> {
  _$SubItemDtoCopyWithImpl(this._self, this._then);

  final SubItemDto _self;
  final $Res Function(SubItemDto) _then;

/// Create a copy of SubItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subId = null,Object? subName = null,Object? orderIndex = null,Object? subUrl = freezed,Object? lastUpdated = freezed,Object? userAgent = freezed,Object? filterRegex = freezed,}) {
  return _then(_self.copyWith(
subId: null == subId ? _self.subId : subId // ignore: cast_nullable_to_non_nullable
as String,subName: null == subName ? _self.subName : subName // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,subUrl: freezed == subUrl ? _self.subUrl : subUrl // ignore: cast_nullable_to_non_nullable
as String?,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime?,userAgent: freezed == userAgent ? _self.userAgent : userAgent // ignore: cast_nullable_to_non_nullable
as String?,filterRegex: freezed == filterRegex ? _self.filterRegex : filterRegex // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SubItemDto].
extension SubItemDtoPatterns on SubItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubItemDto value)  $default,){
final _that = this;
switch (_that) {
case _SubItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _SubItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String subId,  String subName,  int orderIndex,  String? subUrl,  DateTime? lastUpdated,  String? userAgent,  String? filterRegex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubItemDto() when $default != null:
return $default(_that.subId,_that.subName,_that.orderIndex,_that.subUrl,_that.lastUpdated,_that.userAgent,_that.filterRegex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String subId,  String subName,  int orderIndex,  String? subUrl,  DateTime? lastUpdated,  String? userAgent,  String? filterRegex)  $default,) {final _that = this;
switch (_that) {
case _SubItemDto():
return $default(_that.subId,_that.subName,_that.orderIndex,_that.subUrl,_that.lastUpdated,_that.userAgent,_that.filterRegex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String subId,  String subName,  int orderIndex,  String? subUrl,  DateTime? lastUpdated,  String? userAgent,  String? filterRegex)?  $default,) {final _that = this;
switch (_that) {
case _SubItemDto() when $default != null:
return $default(_that.subId,_that.subName,_that.orderIndex,_that.subUrl,_that.lastUpdated,_that.userAgent,_that.filterRegex);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubItemDto implements SubItemDto {
  const _SubItemDto({required this.subId, this.subName = '', this.orderIndex = 0, this.subUrl, this.lastUpdated, this.userAgent, this.filterRegex});
  factory _SubItemDto.fromJson(Map<String, dynamic> json) => _$SubItemDtoFromJson(json);

@override final  String subId;
@override@JsonKey() final  String subName;
@override@JsonKey() final  int orderIndex;
@override final  String? subUrl;
@override final  DateTime? lastUpdated;
@override final  String? userAgent;
@override final  String? filterRegex;

/// Create a copy of SubItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubItemDtoCopyWith<_SubItemDto> get copyWith => __$SubItemDtoCopyWithImpl<_SubItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubItemDto&&(identical(other.subId, subId) || other.subId == subId)&&(identical(other.subName, subName) || other.subName == subName)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.subUrl, subUrl) || other.subUrl == subUrl)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.userAgent, userAgent) || other.userAgent == userAgent)&&(identical(other.filterRegex, filterRegex) || other.filterRegex == filterRegex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subId,subName,orderIndex,subUrl,lastUpdated,userAgent,filterRegex);

@override
String toString() {
  return 'SubItemDto(subId: $subId, subName: $subName, orderIndex: $orderIndex, subUrl: $subUrl, lastUpdated: $lastUpdated, userAgent: $userAgent, filterRegex: $filterRegex)';
}


}

/// @nodoc
abstract mixin class _$SubItemDtoCopyWith<$Res> implements $SubItemDtoCopyWith<$Res> {
  factory _$SubItemDtoCopyWith(_SubItemDto value, $Res Function(_SubItemDto) _then) = __$SubItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String subId, String subName, int orderIndex, String? subUrl, DateTime? lastUpdated, String? userAgent, String? filterRegex
});




}
/// @nodoc
class __$SubItemDtoCopyWithImpl<$Res>
    implements _$SubItemDtoCopyWith<$Res> {
  __$SubItemDtoCopyWithImpl(this._self, this._then);

  final _SubItemDto _self;
  final $Res Function(_SubItemDto) _then;

/// Create a copy of SubItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subId = null,Object? subName = null,Object? orderIndex = null,Object? subUrl = freezed,Object? lastUpdated = freezed,Object? userAgent = freezed,Object? filterRegex = freezed,}) {
  return _then(_SubItemDto(
subId: null == subId ? _self.subId : subId // ignore: cast_nullable_to_non_nullable
as String,subName: null == subName ? _self.subName : subName // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,subUrl: freezed == subUrl ? _self.subUrl : subUrl // ignore: cast_nullable_to_non_nullable
as String?,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime?,userAgent: freezed == userAgent ? _self.userAgent : userAgent // ignore: cast_nullable_to_non_nullable
as String?,filterRegex: freezed == filterRegex ? _self.filterRegex : filterRegex // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
