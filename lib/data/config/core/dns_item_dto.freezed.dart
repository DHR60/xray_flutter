// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dns_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DnsItemDto {

 String get remoteDns; String get localDns; bool get enableFakeDns; String get additionalHosts; bool get serveStale; bool get parallelQuery;
/// Create a copy of DnsItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DnsItemDtoCopyWith<DnsItemDto> get copyWith => _$DnsItemDtoCopyWithImpl<DnsItemDto>(this as DnsItemDto, _$identity);

  /// Serializes this DnsItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DnsItemDto&&(identical(other.remoteDns, remoteDns) || other.remoteDns == remoteDns)&&(identical(other.localDns, localDns) || other.localDns == localDns)&&(identical(other.enableFakeDns, enableFakeDns) || other.enableFakeDns == enableFakeDns)&&(identical(other.additionalHosts, additionalHosts) || other.additionalHosts == additionalHosts)&&(identical(other.serveStale, serveStale) || other.serveStale == serveStale)&&(identical(other.parallelQuery, parallelQuery) || other.parallelQuery == parallelQuery));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,remoteDns,localDns,enableFakeDns,additionalHosts,serveStale,parallelQuery);

@override
String toString() {
  return 'DnsItemDto(remoteDns: $remoteDns, localDns: $localDns, enableFakeDns: $enableFakeDns, additionalHosts: $additionalHosts, serveStale: $serveStale, parallelQuery: $parallelQuery)';
}


}

/// @nodoc
abstract mixin class $DnsItemDtoCopyWith<$Res>  {
  factory $DnsItemDtoCopyWith(DnsItemDto value, $Res Function(DnsItemDto) _then) = _$DnsItemDtoCopyWithImpl;
@useResult
$Res call({
 String remoteDns, String localDns, bool enableFakeDns, String additionalHosts, bool serveStale, bool parallelQuery
});




}
/// @nodoc
class _$DnsItemDtoCopyWithImpl<$Res>
    implements $DnsItemDtoCopyWith<$Res> {
  _$DnsItemDtoCopyWithImpl(this._self, this._then);

  final DnsItemDto _self;
  final $Res Function(DnsItemDto) _then;

/// Create a copy of DnsItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? remoteDns = null,Object? localDns = null,Object? enableFakeDns = null,Object? additionalHosts = null,Object? serveStale = null,Object? parallelQuery = null,}) {
  return _then(_self.copyWith(
remoteDns: null == remoteDns ? _self.remoteDns : remoteDns // ignore: cast_nullable_to_non_nullable
as String,localDns: null == localDns ? _self.localDns : localDns // ignore: cast_nullable_to_non_nullable
as String,enableFakeDns: null == enableFakeDns ? _self.enableFakeDns : enableFakeDns // ignore: cast_nullable_to_non_nullable
as bool,additionalHosts: null == additionalHosts ? _self.additionalHosts : additionalHosts // ignore: cast_nullable_to_non_nullable
as String,serveStale: null == serveStale ? _self.serveStale : serveStale // ignore: cast_nullable_to_non_nullable
as bool,parallelQuery: null == parallelQuery ? _self.parallelQuery : parallelQuery // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DnsItemDto].
extension DnsItemDtoPatterns on DnsItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DnsItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DnsItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DnsItemDto value)  $default,){
final _that = this;
switch (_that) {
case _DnsItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DnsItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _DnsItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String remoteDns,  String localDns,  bool enableFakeDns,  String additionalHosts,  bool serveStale,  bool parallelQuery)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DnsItemDto() when $default != null:
return $default(_that.remoteDns,_that.localDns,_that.enableFakeDns,_that.additionalHosts,_that.serveStale,_that.parallelQuery);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String remoteDns,  String localDns,  bool enableFakeDns,  String additionalHosts,  bool serveStale,  bool parallelQuery)  $default,) {final _that = this;
switch (_that) {
case _DnsItemDto():
return $default(_that.remoteDns,_that.localDns,_that.enableFakeDns,_that.additionalHosts,_that.serveStale,_that.parallelQuery);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String remoteDns,  String localDns,  bool enableFakeDns,  String additionalHosts,  bool serveStale,  bool parallelQuery)?  $default,) {final _that = this;
switch (_that) {
case _DnsItemDto() when $default != null:
return $default(_that.remoteDns,_that.localDns,_that.enableFakeDns,_that.additionalHosts,_that.serveStale,_that.parallelQuery);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DnsItemDto implements DnsItemDto {
  const _DnsItemDto({this.remoteDns = GlobalConst.defaultRemoteDns, this.localDns = GlobalConst.defaultLocalDns, this.enableFakeDns = false, this.additionalHosts = '', this.serveStale = false, this.parallelQuery = false});
  factory _DnsItemDto.fromJson(Map<String, dynamic> json) => _$DnsItemDtoFromJson(json);

@override@JsonKey() final  String remoteDns;
@override@JsonKey() final  String localDns;
@override@JsonKey() final  bool enableFakeDns;
@override@JsonKey() final  String additionalHosts;
@override@JsonKey() final  bool serveStale;
@override@JsonKey() final  bool parallelQuery;

/// Create a copy of DnsItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DnsItemDtoCopyWith<_DnsItemDto> get copyWith => __$DnsItemDtoCopyWithImpl<_DnsItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DnsItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DnsItemDto&&(identical(other.remoteDns, remoteDns) || other.remoteDns == remoteDns)&&(identical(other.localDns, localDns) || other.localDns == localDns)&&(identical(other.enableFakeDns, enableFakeDns) || other.enableFakeDns == enableFakeDns)&&(identical(other.additionalHosts, additionalHosts) || other.additionalHosts == additionalHosts)&&(identical(other.serveStale, serveStale) || other.serveStale == serveStale)&&(identical(other.parallelQuery, parallelQuery) || other.parallelQuery == parallelQuery));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,remoteDns,localDns,enableFakeDns,additionalHosts,serveStale,parallelQuery);

@override
String toString() {
  return 'DnsItemDto(remoteDns: $remoteDns, localDns: $localDns, enableFakeDns: $enableFakeDns, additionalHosts: $additionalHosts, serveStale: $serveStale, parallelQuery: $parallelQuery)';
}


}

/// @nodoc
abstract mixin class _$DnsItemDtoCopyWith<$Res> implements $DnsItemDtoCopyWith<$Res> {
  factory _$DnsItemDtoCopyWith(_DnsItemDto value, $Res Function(_DnsItemDto) _then) = __$DnsItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String remoteDns, String localDns, bool enableFakeDns, String additionalHosts, bool serveStale, bool parallelQuery
});




}
/// @nodoc
class __$DnsItemDtoCopyWithImpl<$Res>
    implements _$DnsItemDtoCopyWith<$Res> {
  __$DnsItemDtoCopyWithImpl(this._self, this._then);

  final _DnsItemDto _self;
  final $Res Function(_DnsItemDto) _then;

/// Create a copy of DnsItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? remoteDns = null,Object? localDns = null,Object? enableFakeDns = null,Object? additionalHosts = null,Object? serveStale = null,Object? parallelQuery = null,}) {
  return _then(_DnsItemDto(
remoteDns: null == remoteDns ? _self.remoteDns : remoteDns // ignore: cast_nullable_to_non_nullable
as String,localDns: null == localDns ? _self.localDns : localDns // ignore: cast_nullable_to_non_nullable
as String,enableFakeDns: null == enableFakeDns ? _self.enableFakeDns : enableFakeDns // ignore: cast_nullable_to_non_nullable
as bool,additionalHosts: null == additionalHosts ? _self.additionalHosts : additionalHosts // ignore: cast_nullable_to_non_nullable
as String,serveStale: null == serveStale ? _self.serveStale : serveStale // ignore: cast_nullable_to_non_nullable
as bool,parallelQuery: null == parallelQuery ? _self.parallelQuery : parallelQuery // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
