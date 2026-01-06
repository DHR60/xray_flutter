// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_extra_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileExtraItemDto {

 String? get flow; String? get alterId; String? get vlessEncryption; String? get vlessVisionSeed; bool? get ssPluginEnabled; String? get ssPlugin; String? get ssPluginParam; String? get wireguardLocalAddress; String? get wireguardPreSharedKey; String? get wireguardReserved; String? get wireguardPublicKey; int? get wireguardMtu;
/// Create a copy of ProfileExtraItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileExtraItemDtoCopyWith<ProfileExtraItemDto> get copyWith => _$ProfileExtraItemDtoCopyWithImpl<ProfileExtraItemDto>(this as ProfileExtraItemDto, _$identity);

  /// Serializes this ProfileExtraItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileExtraItemDto&&(identical(other.flow, flow) || other.flow == flow)&&(identical(other.alterId, alterId) || other.alterId == alterId)&&(identical(other.vlessEncryption, vlessEncryption) || other.vlessEncryption == vlessEncryption)&&(identical(other.vlessVisionSeed, vlessVisionSeed) || other.vlessVisionSeed == vlessVisionSeed)&&(identical(other.ssPluginEnabled, ssPluginEnabled) || other.ssPluginEnabled == ssPluginEnabled)&&(identical(other.ssPlugin, ssPlugin) || other.ssPlugin == ssPlugin)&&(identical(other.ssPluginParam, ssPluginParam) || other.ssPluginParam == ssPluginParam)&&(identical(other.wireguardLocalAddress, wireguardLocalAddress) || other.wireguardLocalAddress == wireguardLocalAddress)&&(identical(other.wireguardPreSharedKey, wireguardPreSharedKey) || other.wireguardPreSharedKey == wireguardPreSharedKey)&&(identical(other.wireguardReserved, wireguardReserved) || other.wireguardReserved == wireguardReserved)&&(identical(other.wireguardPublicKey, wireguardPublicKey) || other.wireguardPublicKey == wireguardPublicKey)&&(identical(other.wireguardMtu, wireguardMtu) || other.wireguardMtu == wireguardMtu));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,flow,alterId,vlessEncryption,vlessVisionSeed,ssPluginEnabled,ssPlugin,ssPluginParam,wireguardLocalAddress,wireguardPreSharedKey,wireguardReserved,wireguardPublicKey,wireguardMtu);

@override
String toString() {
  return 'ProfileExtraItemDto(flow: $flow, alterId: $alterId, vlessEncryption: $vlessEncryption, vlessVisionSeed: $vlessVisionSeed, ssPluginEnabled: $ssPluginEnabled, ssPlugin: $ssPlugin, ssPluginParam: $ssPluginParam, wireguardLocalAddress: $wireguardLocalAddress, wireguardPreSharedKey: $wireguardPreSharedKey, wireguardReserved: $wireguardReserved, wireguardPublicKey: $wireguardPublicKey, wireguardMtu: $wireguardMtu)';
}


}

/// @nodoc
abstract mixin class $ProfileExtraItemDtoCopyWith<$Res>  {
  factory $ProfileExtraItemDtoCopyWith(ProfileExtraItemDto value, $Res Function(ProfileExtraItemDto) _then) = _$ProfileExtraItemDtoCopyWithImpl;
@useResult
$Res call({
 String? flow, String? alterId, String? vlessEncryption, String? vlessVisionSeed, bool? ssPluginEnabled, String? ssPlugin, String? ssPluginParam, String? wireguardLocalAddress, String? wireguardPreSharedKey, String? wireguardReserved, String? wireguardPublicKey, int? wireguardMtu
});




}
/// @nodoc
class _$ProfileExtraItemDtoCopyWithImpl<$Res>
    implements $ProfileExtraItemDtoCopyWith<$Res> {
  _$ProfileExtraItemDtoCopyWithImpl(this._self, this._then);

  final ProfileExtraItemDto _self;
  final $Res Function(ProfileExtraItemDto) _then;

/// Create a copy of ProfileExtraItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? flow = freezed,Object? alterId = freezed,Object? vlessEncryption = freezed,Object? vlessVisionSeed = freezed,Object? ssPluginEnabled = freezed,Object? ssPlugin = freezed,Object? ssPluginParam = freezed,Object? wireguardLocalAddress = freezed,Object? wireguardPreSharedKey = freezed,Object? wireguardReserved = freezed,Object? wireguardPublicKey = freezed,Object? wireguardMtu = freezed,}) {
  return _then(_self.copyWith(
flow: freezed == flow ? _self.flow : flow // ignore: cast_nullable_to_non_nullable
as String?,alterId: freezed == alterId ? _self.alterId : alterId // ignore: cast_nullable_to_non_nullable
as String?,vlessEncryption: freezed == vlessEncryption ? _self.vlessEncryption : vlessEncryption // ignore: cast_nullable_to_non_nullable
as String?,vlessVisionSeed: freezed == vlessVisionSeed ? _self.vlessVisionSeed : vlessVisionSeed // ignore: cast_nullable_to_non_nullable
as String?,ssPluginEnabled: freezed == ssPluginEnabled ? _self.ssPluginEnabled : ssPluginEnabled // ignore: cast_nullable_to_non_nullable
as bool?,ssPlugin: freezed == ssPlugin ? _self.ssPlugin : ssPlugin // ignore: cast_nullable_to_non_nullable
as String?,ssPluginParam: freezed == ssPluginParam ? _self.ssPluginParam : ssPluginParam // ignore: cast_nullable_to_non_nullable
as String?,wireguardLocalAddress: freezed == wireguardLocalAddress ? _self.wireguardLocalAddress : wireguardLocalAddress // ignore: cast_nullable_to_non_nullable
as String?,wireguardPreSharedKey: freezed == wireguardPreSharedKey ? _self.wireguardPreSharedKey : wireguardPreSharedKey // ignore: cast_nullable_to_non_nullable
as String?,wireguardReserved: freezed == wireguardReserved ? _self.wireguardReserved : wireguardReserved // ignore: cast_nullable_to_non_nullable
as String?,wireguardPublicKey: freezed == wireguardPublicKey ? _self.wireguardPublicKey : wireguardPublicKey // ignore: cast_nullable_to_non_nullable
as String?,wireguardMtu: freezed == wireguardMtu ? _self.wireguardMtu : wireguardMtu // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileExtraItemDto].
extension ProfileExtraItemDtoPatterns on ProfileExtraItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileExtraItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileExtraItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileExtraItemDto value)  $default,){
final _that = this;
switch (_that) {
case _ProfileExtraItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileExtraItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileExtraItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? flow,  String? alterId,  String? vlessEncryption,  String? vlessVisionSeed,  bool? ssPluginEnabled,  String? ssPlugin,  String? ssPluginParam,  String? wireguardLocalAddress,  String? wireguardPreSharedKey,  String? wireguardReserved,  String? wireguardPublicKey,  int? wireguardMtu)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileExtraItemDto() when $default != null:
return $default(_that.flow,_that.alterId,_that.vlessEncryption,_that.vlessVisionSeed,_that.ssPluginEnabled,_that.ssPlugin,_that.ssPluginParam,_that.wireguardLocalAddress,_that.wireguardPreSharedKey,_that.wireguardReserved,_that.wireguardPublicKey,_that.wireguardMtu);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? flow,  String? alterId,  String? vlessEncryption,  String? vlessVisionSeed,  bool? ssPluginEnabled,  String? ssPlugin,  String? ssPluginParam,  String? wireguardLocalAddress,  String? wireguardPreSharedKey,  String? wireguardReserved,  String? wireguardPublicKey,  int? wireguardMtu)  $default,) {final _that = this;
switch (_that) {
case _ProfileExtraItemDto():
return $default(_that.flow,_that.alterId,_that.vlessEncryption,_that.vlessVisionSeed,_that.ssPluginEnabled,_that.ssPlugin,_that.ssPluginParam,_that.wireguardLocalAddress,_that.wireguardPreSharedKey,_that.wireguardReserved,_that.wireguardPublicKey,_that.wireguardMtu);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? flow,  String? alterId,  String? vlessEncryption,  String? vlessVisionSeed,  bool? ssPluginEnabled,  String? ssPlugin,  String? ssPluginParam,  String? wireguardLocalAddress,  String? wireguardPreSharedKey,  String? wireguardReserved,  String? wireguardPublicKey,  int? wireguardMtu)?  $default,) {final _that = this;
switch (_that) {
case _ProfileExtraItemDto() when $default != null:
return $default(_that.flow,_that.alterId,_that.vlessEncryption,_that.vlessVisionSeed,_that.ssPluginEnabled,_that.ssPlugin,_that.ssPluginParam,_that.wireguardLocalAddress,_that.wireguardPreSharedKey,_that.wireguardReserved,_that.wireguardPublicKey,_that.wireguardMtu);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileExtraItemDto implements ProfileExtraItemDto {
  const _ProfileExtraItemDto({this.flow, this.alterId, this.vlessEncryption, this.vlessVisionSeed, this.ssPluginEnabled, this.ssPlugin, this.ssPluginParam, this.wireguardLocalAddress, this.wireguardPreSharedKey, this.wireguardReserved, this.wireguardPublicKey, this.wireguardMtu});
  factory _ProfileExtraItemDto.fromJson(Map<String, dynamic> json) => _$ProfileExtraItemDtoFromJson(json);

@override final  String? flow;
@override final  String? alterId;
@override final  String? vlessEncryption;
@override final  String? vlessVisionSeed;
@override final  bool? ssPluginEnabled;
@override final  String? ssPlugin;
@override final  String? ssPluginParam;
@override final  String? wireguardLocalAddress;
@override final  String? wireguardPreSharedKey;
@override final  String? wireguardReserved;
@override final  String? wireguardPublicKey;
@override final  int? wireguardMtu;

/// Create a copy of ProfileExtraItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileExtraItemDtoCopyWith<_ProfileExtraItemDto> get copyWith => __$ProfileExtraItemDtoCopyWithImpl<_ProfileExtraItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileExtraItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileExtraItemDto&&(identical(other.flow, flow) || other.flow == flow)&&(identical(other.alterId, alterId) || other.alterId == alterId)&&(identical(other.vlessEncryption, vlessEncryption) || other.vlessEncryption == vlessEncryption)&&(identical(other.vlessVisionSeed, vlessVisionSeed) || other.vlessVisionSeed == vlessVisionSeed)&&(identical(other.ssPluginEnabled, ssPluginEnabled) || other.ssPluginEnabled == ssPluginEnabled)&&(identical(other.ssPlugin, ssPlugin) || other.ssPlugin == ssPlugin)&&(identical(other.ssPluginParam, ssPluginParam) || other.ssPluginParam == ssPluginParam)&&(identical(other.wireguardLocalAddress, wireguardLocalAddress) || other.wireguardLocalAddress == wireguardLocalAddress)&&(identical(other.wireguardPreSharedKey, wireguardPreSharedKey) || other.wireguardPreSharedKey == wireguardPreSharedKey)&&(identical(other.wireguardReserved, wireguardReserved) || other.wireguardReserved == wireguardReserved)&&(identical(other.wireguardPublicKey, wireguardPublicKey) || other.wireguardPublicKey == wireguardPublicKey)&&(identical(other.wireguardMtu, wireguardMtu) || other.wireguardMtu == wireguardMtu));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,flow,alterId,vlessEncryption,vlessVisionSeed,ssPluginEnabled,ssPlugin,ssPluginParam,wireguardLocalAddress,wireguardPreSharedKey,wireguardReserved,wireguardPublicKey,wireguardMtu);

@override
String toString() {
  return 'ProfileExtraItemDto(flow: $flow, alterId: $alterId, vlessEncryption: $vlessEncryption, vlessVisionSeed: $vlessVisionSeed, ssPluginEnabled: $ssPluginEnabled, ssPlugin: $ssPlugin, ssPluginParam: $ssPluginParam, wireguardLocalAddress: $wireguardLocalAddress, wireguardPreSharedKey: $wireguardPreSharedKey, wireguardReserved: $wireguardReserved, wireguardPublicKey: $wireguardPublicKey, wireguardMtu: $wireguardMtu)';
}


}

/// @nodoc
abstract mixin class _$ProfileExtraItemDtoCopyWith<$Res> implements $ProfileExtraItemDtoCopyWith<$Res> {
  factory _$ProfileExtraItemDtoCopyWith(_ProfileExtraItemDto value, $Res Function(_ProfileExtraItemDto) _then) = __$ProfileExtraItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String? flow, String? alterId, String? vlessEncryption, String? vlessVisionSeed, bool? ssPluginEnabled, String? ssPlugin, String? ssPluginParam, String? wireguardLocalAddress, String? wireguardPreSharedKey, String? wireguardReserved, String? wireguardPublicKey, int? wireguardMtu
});




}
/// @nodoc
class __$ProfileExtraItemDtoCopyWithImpl<$Res>
    implements _$ProfileExtraItemDtoCopyWith<$Res> {
  __$ProfileExtraItemDtoCopyWithImpl(this._self, this._then);

  final _ProfileExtraItemDto _self;
  final $Res Function(_ProfileExtraItemDto) _then;

/// Create a copy of ProfileExtraItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? flow = freezed,Object? alterId = freezed,Object? vlessEncryption = freezed,Object? vlessVisionSeed = freezed,Object? ssPluginEnabled = freezed,Object? ssPlugin = freezed,Object? ssPluginParam = freezed,Object? wireguardLocalAddress = freezed,Object? wireguardPreSharedKey = freezed,Object? wireguardReserved = freezed,Object? wireguardPublicKey = freezed,Object? wireguardMtu = freezed,}) {
  return _then(_ProfileExtraItemDto(
flow: freezed == flow ? _self.flow : flow // ignore: cast_nullable_to_non_nullable
as String?,alterId: freezed == alterId ? _self.alterId : alterId // ignore: cast_nullable_to_non_nullable
as String?,vlessEncryption: freezed == vlessEncryption ? _self.vlessEncryption : vlessEncryption // ignore: cast_nullable_to_non_nullable
as String?,vlessVisionSeed: freezed == vlessVisionSeed ? _self.vlessVisionSeed : vlessVisionSeed // ignore: cast_nullable_to_non_nullable
as String?,ssPluginEnabled: freezed == ssPluginEnabled ? _self.ssPluginEnabled : ssPluginEnabled // ignore: cast_nullable_to_non_nullable
as bool?,ssPlugin: freezed == ssPlugin ? _self.ssPlugin : ssPlugin // ignore: cast_nullable_to_non_nullable
as String?,ssPluginParam: freezed == ssPluginParam ? _self.ssPluginParam : ssPluginParam // ignore: cast_nullable_to_non_nullable
as String?,wireguardLocalAddress: freezed == wireguardLocalAddress ? _self.wireguardLocalAddress : wireguardLocalAddress // ignore: cast_nullable_to_non_nullable
as String?,wireguardPreSharedKey: freezed == wireguardPreSharedKey ? _self.wireguardPreSharedKey : wireguardPreSharedKey // ignore: cast_nullable_to_non_nullable
as String?,wireguardReserved: freezed == wireguardReserved ? _self.wireguardReserved : wireguardReserved // ignore: cast_nullable_to_non_nullable
as String?,wireguardPublicKey: freezed == wireguardPublicKey ? _self.wireguardPublicKey : wireguardPublicKey // ignore: cast_nullable_to_non_nullable
as String?,wireguardMtu: freezed == wireguardMtu ? _self.wireguardMtu : wireguardMtu // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
