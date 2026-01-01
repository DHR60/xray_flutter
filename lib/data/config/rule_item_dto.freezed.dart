// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rule_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RuleItemDto {

 String get id; int get orderIndex; String get ruleType; String get outboundTag; String get inboundTag; String get ip; String get domain; String get port; String get network; String get protocol; String get remark; bool get enabled;
/// Create a copy of RuleItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RuleItemDtoCopyWith<RuleItemDto> get copyWith => _$RuleItemDtoCopyWithImpl<RuleItemDto>(this as RuleItemDto, _$identity);

  /// Serializes this RuleItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RuleItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.ruleType, ruleType) || other.ruleType == ruleType)&&(identical(other.outboundTag, outboundTag) || other.outboundTag == outboundTag)&&(identical(other.inboundTag, inboundTag) || other.inboundTag == inboundTag)&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.port, port) || other.port == port)&&(identical(other.network, network) || other.network == network)&&(identical(other.protocol, protocol) || other.protocol == protocol)&&(identical(other.remark, remark) || other.remark == remark)&&(identical(other.enabled, enabled) || other.enabled == enabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderIndex,ruleType,outboundTag,inboundTag,ip,domain,port,network,protocol,remark,enabled);

@override
String toString() {
  return 'RuleItemDto(id: $id, orderIndex: $orderIndex, ruleType: $ruleType, outboundTag: $outboundTag, inboundTag: $inboundTag, ip: $ip, domain: $domain, port: $port, network: $network, protocol: $protocol, remark: $remark, enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class $RuleItemDtoCopyWith<$Res>  {
  factory $RuleItemDtoCopyWith(RuleItemDto value, $Res Function(RuleItemDto) _then) = _$RuleItemDtoCopyWithImpl;
@useResult
$Res call({
 String id, int orderIndex, String ruleType, String outboundTag, String inboundTag, String ip, String domain, String port, String network, String protocol, String remark, bool enabled
});




}
/// @nodoc
class _$RuleItemDtoCopyWithImpl<$Res>
    implements $RuleItemDtoCopyWith<$Res> {
  _$RuleItemDtoCopyWithImpl(this._self, this._then);

  final RuleItemDto _self;
  final $Res Function(RuleItemDto) _then;

/// Create a copy of RuleItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderIndex = null,Object? ruleType = null,Object? outboundTag = null,Object? inboundTag = null,Object? ip = null,Object? domain = null,Object? port = null,Object? network = null,Object? protocol = null,Object? remark = null,Object? enabled = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,ruleType: null == ruleType ? _self.ruleType : ruleType // ignore: cast_nullable_to_non_nullable
as String,outboundTag: null == outboundTag ? _self.outboundTag : outboundTag // ignore: cast_nullable_to_non_nullable
as String,inboundTag: null == inboundTag ? _self.inboundTag : inboundTag // ignore: cast_nullable_to_non_nullable
as String,ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String,domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as String,network: null == network ? _self.network : network // ignore: cast_nullable_to_non_nullable
as String,protocol: null == protocol ? _self.protocol : protocol // ignore: cast_nullable_to_non_nullable
as String,remark: null == remark ? _self.remark : remark // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RuleItemDto].
extension RuleItemDtoPatterns on RuleItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RuleItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RuleItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RuleItemDto value)  $default,){
final _that = this;
switch (_that) {
case _RuleItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RuleItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _RuleItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int orderIndex,  String ruleType,  String outboundTag,  String inboundTag,  String ip,  String domain,  String port,  String network,  String protocol,  String remark,  bool enabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RuleItemDto() when $default != null:
return $default(_that.id,_that.orderIndex,_that.ruleType,_that.outboundTag,_that.inboundTag,_that.ip,_that.domain,_that.port,_that.network,_that.protocol,_that.remark,_that.enabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int orderIndex,  String ruleType,  String outboundTag,  String inboundTag,  String ip,  String domain,  String port,  String network,  String protocol,  String remark,  bool enabled)  $default,) {final _that = this;
switch (_that) {
case _RuleItemDto():
return $default(_that.id,_that.orderIndex,_that.ruleType,_that.outboundTag,_that.inboundTag,_that.ip,_that.domain,_that.port,_that.network,_that.protocol,_that.remark,_that.enabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int orderIndex,  String ruleType,  String outboundTag,  String inboundTag,  String ip,  String domain,  String port,  String network,  String protocol,  String remark,  bool enabled)?  $default,) {final _that = this;
switch (_that) {
case _RuleItemDto() when $default != null:
return $default(_that.id,_that.orderIndex,_that.ruleType,_that.outboundTag,_that.inboundTag,_that.ip,_that.domain,_that.port,_that.network,_that.protocol,_that.remark,_that.enabled);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RuleItemDto implements RuleItemDto {
  const _RuleItemDto({required this.id, this.orderIndex = 0, this.ruleType = 'all', this.outboundTag = '', this.inboundTag = '', this.ip = '', this.domain = '', this.port = '', this.network = '', this.protocol = '', this.remark = '', this.enabled = true});
  factory _RuleItemDto.fromJson(Map<String, dynamic> json) => _$RuleItemDtoFromJson(json);

@override final  String id;
@override@JsonKey() final  int orderIndex;
@override@JsonKey() final  String ruleType;
@override@JsonKey() final  String outboundTag;
@override@JsonKey() final  String inboundTag;
@override@JsonKey() final  String ip;
@override@JsonKey() final  String domain;
@override@JsonKey() final  String port;
@override@JsonKey() final  String network;
@override@JsonKey() final  String protocol;
@override@JsonKey() final  String remark;
@override@JsonKey() final  bool enabled;

/// Create a copy of RuleItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RuleItemDtoCopyWith<_RuleItemDto> get copyWith => __$RuleItemDtoCopyWithImpl<_RuleItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RuleItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RuleItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.ruleType, ruleType) || other.ruleType == ruleType)&&(identical(other.outboundTag, outboundTag) || other.outboundTag == outboundTag)&&(identical(other.inboundTag, inboundTag) || other.inboundTag == inboundTag)&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.port, port) || other.port == port)&&(identical(other.network, network) || other.network == network)&&(identical(other.protocol, protocol) || other.protocol == protocol)&&(identical(other.remark, remark) || other.remark == remark)&&(identical(other.enabled, enabled) || other.enabled == enabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderIndex,ruleType,outboundTag,inboundTag,ip,domain,port,network,protocol,remark,enabled);

@override
String toString() {
  return 'RuleItemDto(id: $id, orderIndex: $orderIndex, ruleType: $ruleType, outboundTag: $outboundTag, inboundTag: $inboundTag, ip: $ip, domain: $domain, port: $port, network: $network, protocol: $protocol, remark: $remark, enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class _$RuleItemDtoCopyWith<$Res> implements $RuleItemDtoCopyWith<$Res> {
  factory _$RuleItemDtoCopyWith(_RuleItemDto value, $Res Function(_RuleItemDto) _then) = __$RuleItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, int orderIndex, String ruleType, String outboundTag, String inboundTag, String ip, String domain, String port, String network, String protocol, String remark, bool enabled
});




}
/// @nodoc
class __$RuleItemDtoCopyWithImpl<$Res>
    implements _$RuleItemDtoCopyWith<$Res> {
  __$RuleItemDtoCopyWithImpl(this._self, this._then);

  final _RuleItemDto _self;
  final $Res Function(_RuleItemDto) _then;

/// Create a copy of RuleItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderIndex = null,Object? ruleType = null,Object? outboundTag = null,Object? inboundTag = null,Object? ip = null,Object? domain = null,Object? port = null,Object? network = null,Object? protocol = null,Object? remark = null,Object? enabled = null,}) {
  return _then(_RuleItemDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,ruleType: null == ruleType ? _self.ruleType : ruleType // ignore: cast_nullable_to_non_nullable
as String,outboundTag: null == outboundTag ? _self.outboundTag : outboundTag // ignore: cast_nullable_to_non_nullable
as String,inboundTag: null == inboundTag ? _self.inboundTag : inboundTag // ignore: cast_nullable_to_non_nullable
as String,ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String,domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as String,network: null == network ? _self.network : network // ignore: cast_nullable_to_non_nullable
as String,protocol: null == protocol ? _self.protocol : protocol // ignore: cast_nullable_to_non_nullable
as String,remark: null == remark ? _self.remark : remark // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
