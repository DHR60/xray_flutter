// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vmess_share_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VmessShareDto {

 String? get v; String? get ps; String? get add; String? get port; String? get id; String? get aid; String? get scy; String? get net; String? get type; String? get host; String? get path; String? get tls; String? get sni; String? get alpn; String? get fp;
/// Create a copy of VmessShareDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VmessShareDtoCopyWith<VmessShareDto> get copyWith => _$VmessShareDtoCopyWithImpl<VmessShareDto>(this as VmessShareDto, _$identity);

  /// Serializes this VmessShareDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VmessShareDto&&(identical(other.v, v) || other.v == v)&&(identical(other.ps, ps) || other.ps == ps)&&(identical(other.add, add) || other.add == add)&&(identical(other.port, port) || other.port == port)&&(identical(other.id, id) || other.id == id)&&(identical(other.aid, aid) || other.aid == aid)&&(identical(other.scy, scy) || other.scy == scy)&&(identical(other.net, net) || other.net == net)&&(identical(other.type, type) || other.type == type)&&(identical(other.host, host) || other.host == host)&&(identical(other.path, path) || other.path == path)&&(identical(other.tls, tls) || other.tls == tls)&&(identical(other.sni, sni) || other.sni == sni)&&(identical(other.alpn, alpn) || other.alpn == alpn)&&(identical(other.fp, fp) || other.fp == fp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,v,ps,add,port,id,aid,scy,net,type,host,path,tls,sni,alpn,fp);

@override
String toString() {
  return 'VmessShareDto(v: $v, ps: $ps, add: $add, port: $port, id: $id, aid: $aid, scy: $scy, net: $net, type: $type, host: $host, path: $path, tls: $tls, sni: $sni, alpn: $alpn, fp: $fp)';
}


}

/// @nodoc
abstract mixin class $VmessShareDtoCopyWith<$Res>  {
  factory $VmessShareDtoCopyWith(VmessShareDto value, $Res Function(VmessShareDto) _then) = _$VmessShareDtoCopyWithImpl;
@useResult
$Res call({
 String? v, String? ps, String? add, String? port, String? id, String? aid, String? scy, String? net, String? type, String? host, String? path, String? tls, String? sni, String? alpn, String? fp
});




}
/// @nodoc
class _$VmessShareDtoCopyWithImpl<$Res>
    implements $VmessShareDtoCopyWith<$Res> {
  _$VmessShareDtoCopyWithImpl(this._self, this._then);

  final VmessShareDto _self;
  final $Res Function(VmessShareDto) _then;

/// Create a copy of VmessShareDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? v = freezed,Object? ps = freezed,Object? add = freezed,Object? port = freezed,Object? id = freezed,Object? aid = freezed,Object? scy = freezed,Object? net = freezed,Object? type = freezed,Object? host = freezed,Object? path = freezed,Object? tls = freezed,Object? sni = freezed,Object? alpn = freezed,Object? fp = freezed,}) {
  return _then(_self.copyWith(
v: freezed == v ? _self.v : v // ignore: cast_nullable_to_non_nullable
as String?,ps: freezed == ps ? _self.ps : ps // ignore: cast_nullable_to_non_nullable
as String?,add: freezed == add ? _self.add : add // ignore: cast_nullable_to_non_nullable
as String?,port: freezed == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,aid: freezed == aid ? _self.aid : aid // ignore: cast_nullable_to_non_nullable
as String?,scy: freezed == scy ? _self.scy : scy // ignore: cast_nullable_to_non_nullable
as String?,net: freezed == net ? _self.net : net // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,host: freezed == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String?,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,tls: freezed == tls ? _self.tls : tls // ignore: cast_nullable_to_non_nullable
as String?,sni: freezed == sni ? _self.sni : sni // ignore: cast_nullable_to_non_nullable
as String?,alpn: freezed == alpn ? _self.alpn : alpn // ignore: cast_nullable_to_non_nullable
as String?,fp: freezed == fp ? _self.fp : fp // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VmessShareDto].
extension VmessShareDtoPatterns on VmessShareDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VmessShareDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VmessShareDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VmessShareDto value)  $default,){
final _that = this;
switch (_that) {
case _VmessShareDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VmessShareDto value)?  $default,){
final _that = this;
switch (_that) {
case _VmessShareDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? v,  String? ps,  String? add,  String? port,  String? id,  String? aid,  String? scy,  String? net,  String? type,  String? host,  String? path,  String? tls,  String? sni,  String? alpn,  String? fp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VmessShareDto() when $default != null:
return $default(_that.v,_that.ps,_that.add,_that.port,_that.id,_that.aid,_that.scy,_that.net,_that.type,_that.host,_that.path,_that.tls,_that.sni,_that.alpn,_that.fp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? v,  String? ps,  String? add,  String? port,  String? id,  String? aid,  String? scy,  String? net,  String? type,  String? host,  String? path,  String? tls,  String? sni,  String? alpn,  String? fp)  $default,) {final _that = this;
switch (_that) {
case _VmessShareDto():
return $default(_that.v,_that.ps,_that.add,_that.port,_that.id,_that.aid,_that.scy,_that.net,_that.type,_that.host,_that.path,_that.tls,_that.sni,_that.alpn,_that.fp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? v,  String? ps,  String? add,  String? port,  String? id,  String? aid,  String? scy,  String? net,  String? type,  String? host,  String? path,  String? tls,  String? sni,  String? alpn,  String? fp)?  $default,) {final _that = this;
switch (_that) {
case _VmessShareDto() when $default != null:
return $default(_that.v,_that.ps,_that.add,_that.port,_that.id,_that.aid,_that.scy,_that.net,_that.type,_that.host,_that.path,_that.tls,_that.sni,_that.alpn,_that.fp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VmessShareDto implements VmessShareDto {
   _VmessShareDto({this.v, this.ps, this.add, this.port, this.id, this.aid, this.scy, this.net, this.type, this.host, this.path, this.tls, this.sni, this.alpn, this.fp});
  factory _VmessShareDto.fromJson(Map<String, dynamic> json) => _$VmessShareDtoFromJson(json);

@override final  String? v;
@override final  String? ps;
@override final  String? add;
@override final  String? port;
@override final  String? id;
@override final  String? aid;
@override final  String? scy;
@override final  String? net;
@override final  String? type;
@override final  String? host;
@override final  String? path;
@override final  String? tls;
@override final  String? sni;
@override final  String? alpn;
@override final  String? fp;

/// Create a copy of VmessShareDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VmessShareDtoCopyWith<_VmessShareDto> get copyWith => __$VmessShareDtoCopyWithImpl<_VmessShareDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VmessShareDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VmessShareDto&&(identical(other.v, v) || other.v == v)&&(identical(other.ps, ps) || other.ps == ps)&&(identical(other.add, add) || other.add == add)&&(identical(other.port, port) || other.port == port)&&(identical(other.id, id) || other.id == id)&&(identical(other.aid, aid) || other.aid == aid)&&(identical(other.scy, scy) || other.scy == scy)&&(identical(other.net, net) || other.net == net)&&(identical(other.type, type) || other.type == type)&&(identical(other.host, host) || other.host == host)&&(identical(other.path, path) || other.path == path)&&(identical(other.tls, tls) || other.tls == tls)&&(identical(other.sni, sni) || other.sni == sni)&&(identical(other.alpn, alpn) || other.alpn == alpn)&&(identical(other.fp, fp) || other.fp == fp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,v,ps,add,port,id,aid,scy,net,type,host,path,tls,sni,alpn,fp);

@override
String toString() {
  return 'VmessShareDto(v: $v, ps: $ps, add: $add, port: $port, id: $id, aid: $aid, scy: $scy, net: $net, type: $type, host: $host, path: $path, tls: $tls, sni: $sni, alpn: $alpn, fp: $fp)';
}


}

/// @nodoc
abstract mixin class _$VmessShareDtoCopyWith<$Res> implements $VmessShareDtoCopyWith<$Res> {
  factory _$VmessShareDtoCopyWith(_VmessShareDto value, $Res Function(_VmessShareDto) _then) = __$VmessShareDtoCopyWithImpl;
@override @useResult
$Res call({
 String? v, String? ps, String? add, String? port, String? id, String? aid, String? scy, String? net, String? type, String? host, String? path, String? tls, String? sni, String? alpn, String? fp
});




}
/// @nodoc
class __$VmessShareDtoCopyWithImpl<$Res>
    implements _$VmessShareDtoCopyWith<$Res> {
  __$VmessShareDtoCopyWithImpl(this._self, this._then);

  final _VmessShareDto _self;
  final $Res Function(_VmessShareDto) _then;

/// Create a copy of VmessShareDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? v = freezed,Object? ps = freezed,Object? add = freezed,Object? port = freezed,Object? id = freezed,Object? aid = freezed,Object? scy = freezed,Object? net = freezed,Object? type = freezed,Object? host = freezed,Object? path = freezed,Object? tls = freezed,Object? sni = freezed,Object? alpn = freezed,Object? fp = freezed,}) {
  return _then(_VmessShareDto(
v: freezed == v ? _self.v : v // ignore: cast_nullable_to_non_nullable
as String?,ps: freezed == ps ? _self.ps : ps // ignore: cast_nullable_to_non_nullable
as String?,add: freezed == add ? _self.add : add // ignore: cast_nullable_to_non_nullable
as String?,port: freezed == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,aid: freezed == aid ? _self.aid : aid // ignore: cast_nullable_to_non_nullable
as String?,scy: freezed == scy ? _self.scy : scy // ignore: cast_nullable_to_non_nullable
as String?,net: freezed == net ? _self.net : net // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,host: freezed == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String?,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,tls: freezed == tls ? _self.tls : tls // ignore: cast_nullable_to_non_nullable
as String?,sni: freezed == sni ? _self.sni : sni // ignore: cast_nullable_to_non_nullable
as String?,alpn: freezed == alpn ? _self.alpn : alpn // ignore: cast_nullable_to_non_nullable
as String?,fp: freezed == fp ? _self.fp : fp // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
