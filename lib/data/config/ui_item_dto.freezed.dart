// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ui_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UiItemDto {

 int? get fontSize; String? get fontFamily; int? get isDarkMode;
/// Create a copy of UiItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UiItemDtoCopyWith<UiItemDto> get copyWith => _$UiItemDtoCopyWithImpl<UiItemDto>(this as UiItemDto, _$identity);

  /// Serializes this UiItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UiItemDto&&(identical(other.fontSize, fontSize) || other.fontSize == fontSize)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily)&&(identical(other.isDarkMode, isDarkMode) || other.isDarkMode == isDarkMode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fontSize,fontFamily,isDarkMode);

@override
String toString() {
  return 'UiItemDto(fontSize: $fontSize, fontFamily: $fontFamily, isDarkMode: $isDarkMode)';
}


}

/// @nodoc
abstract mixin class $UiItemDtoCopyWith<$Res>  {
  factory $UiItemDtoCopyWith(UiItemDto value, $Res Function(UiItemDto) _then) = _$UiItemDtoCopyWithImpl;
@useResult
$Res call({
 int? fontSize, String? fontFamily, int? isDarkMode
});




}
/// @nodoc
class _$UiItemDtoCopyWithImpl<$Res>
    implements $UiItemDtoCopyWith<$Res> {
  _$UiItemDtoCopyWithImpl(this._self, this._then);

  final UiItemDto _self;
  final $Res Function(UiItemDto) _then;

/// Create a copy of UiItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fontSize = freezed,Object? fontFamily = freezed,Object? isDarkMode = freezed,}) {
  return _then(_self.copyWith(
fontSize: freezed == fontSize ? _self.fontSize : fontSize // ignore: cast_nullable_to_non_nullable
as int?,fontFamily: freezed == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String?,isDarkMode: freezed == isDarkMode ? _self.isDarkMode : isDarkMode // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [UiItemDto].
extension UiItemDtoPatterns on UiItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UiItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UiItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UiItemDto value)  $default,){
final _that = this;
switch (_that) {
case _UiItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UiItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _UiItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? fontSize,  String? fontFamily,  int? isDarkMode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UiItemDto() when $default != null:
return $default(_that.fontSize,_that.fontFamily,_that.isDarkMode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? fontSize,  String? fontFamily,  int? isDarkMode)  $default,) {final _that = this;
switch (_that) {
case _UiItemDto():
return $default(_that.fontSize,_that.fontFamily,_that.isDarkMode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? fontSize,  String? fontFamily,  int? isDarkMode)?  $default,) {final _that = this;
switch (_that) {
case _UiItemDto() when $default != null:
return $default(_that.fontSize,_that.fontFamily,_that.isDarkMode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UiItemDto implements UiItemDto {
  const _UiItemDto({this.fontSize, this.fontFamily, this.isDarkMode});
  factory _UiItemDto.fromJson(Map<String, dynamic> json) => _$UiItemDtoFromJson(json);

@override final  int? fontSize;
@override final  String? fontFamily;
@override final  int? isDarkMode;

/// Create a copy of UiItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UiItemDtoCopyWith<_UiItemDto> get copyWith => __$UiItemDtoCopyWithImpl<_UiItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UiItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UiItemDto&&(identical(other.fontSize, fontSize) || other.fontSize == fontSize)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily)&&(identical(other.isDarkMode, isDarkMode) || other.isDarkMode == isDarkMode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fontSize,fontFamily,isDarkMode);

@override
String toString() {
  return 'UiItemDto(fontSize: $fontSize, fontFamily: $fontFamily, isDarkMode: $isDarkMode)';
}


}

/// @nodoc
abstract mixin class _$UiItemDtoCopyWith<$Res> implements $UiItemDtoCopyWith<$Res> {
  factory _$UiItemDtoCopyWith(_UiItemDto value, $Res Function(_UiItemDto) _then) = __$UiItemDtoCopyWithImpl;
@override @useResult
$Res call({
 int? fontSize, String? fontFamily, int? isDarkMode
});




}
/// @nodoc
class __$UiItemDtoCopyWithImpl<$Res>
    implements _$UiItemDtoCopyWith<$Res> {
  __$UiItemDtoCopyWithImpl(this._self, this._then);

  final _UiItemDto _self;
  final $Res Function(_UiItemDto) _then;

/// Create a copy of UiItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fontSize = freezed,Object? fontFamily = freezed,Object? isDarkMode = freezed,}) {
  return _then(_UiItemDto(
fontSize: freezed == fontSize ? _self.fontSize : fontSize // ignore: cast_nullable_to_non_nullable
as int?,fontFamily: freezed == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String?,isDarkMode: freezed == isDarkMode ? _self.isDarkMode : isDarkMode // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
