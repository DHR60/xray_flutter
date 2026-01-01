// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inbound_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InboundItemDto {

 String get port; bool get sniff; bool get overrideTarget; bool get publicListen;
/// Create a copy of InboundItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InboundItemDtoCopyWith<InboundItemDto> get copyWith => _$InboundItemDtoCopyWithImpl<InboundItemDto>(this as InboundItemDto, _$identity);

  /// Serializes this InboundItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboundItemDto&&(identical(other.port, port) || other.port == port)&&(identical(other.sniff, sniff) || other.sniff == sniff)&&(identical(other.overrideTarget, overrideTarget) || other.overrideTarget == overrideTarget)&&(identical(other.publicListen, publicListen) || other.publicListen == publicListen));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,port,sniff,overrideTarget,publicListen);

@override
String toString() {
  return 'InboundItemDto(port: $port, sniff: $sniff, overrideTarget: $overrideTarget, publicListen: $publicListen)';
}


}

/// @nodoc
abstract mixin class $InboundItemDtoCopyWith<$Res>  {
  factory $InboundItemDtoCopyWith(InboundItemDto value, $Res Function(InboundItemDto) _then) = _$InboundItemDtoCopyWithImpl;
@useResult
$Res call({
 String port, bool sniff, bool overrideTarget, bool publicListen
});




}
/// @nodoc
class _$InboundItemDtoCopyWithImpl<$Res>
    implements $InboundItemDtoCopyWith<$Res> {
  _$InboundItemDtoCopyWithImpl(this._self, this._then);

  final InboundItemDto _self;
  final $Res Function(InboundItemDto) _then;

/// Create a copy of InboundItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? port = null,Object? sniff = null,Object? overrideTarget = null,Object? publicListen = null,}) {
  return _then(_self.copyWith(
port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as String,sniff: null == sniff ? _self.sniff : sniff // ignore: cast_nullable_to_non_nullable
as bool,overrideTarget: null == overrideTarget ? _self.overrideTarget : overrideTarget // ignore: cast_nullable_to_non_nullable
as bool,publicListen: null == publicListen ? _self.publicListen : publicListen // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [InboundItemDto].
extension InboundItemDtoPatterns on InboundItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InboundItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InboundItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InboundItemDto value)  $default,){
final _that = this;
switch (_that) {
case _InboundItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InboundItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _InboundItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String port,  bool sniff,  bool overrideTarget,  bool publicListen)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InboundItemDto() when $default != null:
return $default(_that.port,_that.sniff,_that.overrideTarget,_that.publicListen);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String port,  bool sniff,  bool overrideTarget,  bool publicListen)  $default,) {final _that = this;
switch (_that) {
case _InboundItemDto():
return $default(_that.port,_that.sniff,_that.overrideTarget,_that.publicListen);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String port,  bool sniff,  bool overrideTarget,  bool publicListen)?  $default,) {final _that = this;
switch (_that) {
case _InboundItemDto() when $default != null:
return $default(_that.port,_that.sniff,_that.overrideTarget,_that.publicListen);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InboundItemDto implements InboundItemDto {
  const _InboundItemDto({this.port = '10808', this.sniff = true, this.overrideTarget = false, this.publicListen = false});
  factory _InboundItemDto.fromJson(Map<String, dynamic> json) => _$InboundItemDtoFromJson(json);

@override@JsonKey() final  String port;
@override@JsonKey() final  bool sniff;
@override@JsonKey() final  bool overrideTarget;
@override@JsonKey() final  bool publicListen;

/// Create a copy of InboundItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InboundItemDtoCopyWith<_InboundItemDto> get copyWith => __$InboundItemDtoCopyWithImpl<_InboundItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InboundItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InboundItemDto&&(identical(other.port, port) || other.port == port)&&(identical(other.sniff, sniff) || other.sniff == sniff)&&(identical(other.overrideTarget, overrideTarget) || other.overrideTarget == overrideTarget)&&(identical(other.publicListen, publicListen) || other.publicListen == publicListen));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,port,sniff,overrideTarget,publicListen);

@override
String toString() {
  return 'InboundItemDto(port: $port, sniff: $sniff, overrideTarget: $overrideTarget, publicListen: $publicListen)';
}


}

/// @nodoc
abstract mixin class _$InboundItemDtoCopyWith<$Res> implements $InboundItemDtoCopyWith<$Res> {
  factory _$InboundItemDtoCopyWith(_InboundItemDto value, $Res Function(_InboundItemDto) _then) = __$InboundItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String port, bool sniff, bool overrideTarget, bool publicListen
});




}
/// @nodoc
class __$InboundItemDtoCopyWithImpl<$Res>
    implements _$InboundItemDtoCopyWith<$Res> {
  __$InboundItemDtoCopyWithImpl(this._self, this._then);

  final _InboundItemDto _self;
  final $Res Function(_InboundItemDto) _then;

/// Create a copy of InboundItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? port = null,Object? sniff = null,Object? overrideTarget = null,Object? publicListen = null,}) {
  return _then(_InboundItemDto(
port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as String,sniff: null == sniff ? _self.sniff : sniff // ignore: cast_nullable_to_non_nullable
as bool,overrideTarget: null == overrideTarget ? _self.overrideTarget : overrideTarget // ignore: cast_nullable_to_non_nullable
as bool,publicListen: null == publicListen ? _self.publicListen : publicListen // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
