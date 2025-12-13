// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'routing_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoutingItemDto {

 String get id; String get remark; int get orderIndex; List<RuleItemDto> get rules; bool get enabled; String get strategy; String get url;
/// Create a copy of RoutingItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoutingItemDtoCopyWith<RoutingItemDto> get copyWith => _$RoutingItemDtoCopyWithImpl<RoutingItemDto>(this as RoutingItemDto, _$identity);

  /// Serializes this RoutingItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoutingItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.remark, remark) || other.remark == remark)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&const DeepCollectionEquality().equals(other.rules, rules)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.strategy, strategy) || other.strategy == strategy)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,remark,orderIndex,const DeepCollectionEquality().hash(rules),enabled,strategy,url);

@override
String toString() {
  return 'RoutingItemDto(id: $id, remark: $remark, orderIndex: $orderIndex, rules: $rules, enabled: $enabled, strategy: $strategy, url: $url)';
}


}

/// @nodoc
abstract mixin class $RoutingItemDtoCopyWith<$Res>  {
  factory $RoutingItemDtoCopyWith(RoutingItemDto value, $Res Function(RoutingItemDto) _then) = _$RoutingItemDtoCopyWithImpl;
@useResult
$Res call({
 String id, String remark, int orderIndex, List<RuleItemDto> rules, bool enabled, String strategy, String url
});




}
/// @nodoc
class _$RoutingItemDtoCopyWithImpl<$Res>
    implements $RoutingItemDtoCopyWith<$Res> {
  _$RoutingItemDtoCopyWithImpl(this._self, this._then);

  final RoutingItemDto _self;
  final $Res Function(RoutingItemDto) _then;

/// Create a copy of RoutingItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? remark = null,Object? orderIndex = null,Object? rules = null,Object? enabled = null,Object? strategy = null,Object? url = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,remark: null == remark ? _self.remark : remark // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,rules: null == rules ? _self.rules : rules // ignore: cast_nullable_to_non_nullable
as List<RuleItemDto>,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,strategy: null == strategy ? _self.strategy : strategy // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RoutingItemDto].
extension RoutingItemDtoPatterns on RoutingItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoutingItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoutingItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoutingItemDto value)  $default,){
final _that = this;
switch (_that) {
case _RoutingItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoutingItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _RoutingItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String remark,  int orderIndex,  List<RuleItemDto> rules,  bool enabled,  String strategy,  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoutingItemDto() when $default != null:
return $default(_that.id,_that.remark,_that.orderIndex,_that.rules,_that.enabled,_that.strategy,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String remark,  int orderIndex,  List<RuleItemDto> rules,  bool enabled,  String strategy,  String url)  $default,) {final _that = this;
switch (_that) {
case _RoutingItemDto():
return $default(_that.id,_that.remark,_that.orderIndex,_that.rules,_that.enabled,_that.strategy,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String remark,  int orderIndex,  List<RuleItemDto> rules,  bool enabled,  String strategy,  String url)?  $default,) {final _that = this;
switch (_that) {
case _RoutingItemDto() when $default != null:
return $default(_that.id,_that.remark,_that.orderIndex,_that.rules,_that.enabled,_that.strategy,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoutingItemDto implements RoutingItemDto {
  const _RoutingItemDto({required this.id, this.remark = '', this.orderIndex = 0, final  List<RuleItemDto> rules = const <RuleItemDto>[], this.enabled = true, this.strategy = '', this.url = ''}): _rules = rules;
  factory _RoutingItemDto.fromJson(Map<String, dynamic> json) => _$RoutingItemDtoFromJson(json);

@override final  String id;
@override@JsonKey() final  String remark;
@override@JsonKey() final  int orderIndex;
 final  List<RuleItemDto> _rules;
@override@JsonKey() List<RuleItemDto> get rules {
  if (_rules is EqualUnmodifiableListView) return _rules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rules);
}

@override@JsonKey() final  bool enabled;
@override@JsonKey() final  String strategy;
@override@JsonKey() final  String url;

/// Create a copy of RoutingItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoutingItemDtoCopyWith<_RoutingItemDto> get copyWith => __$RoutingItemDtoCopyWithImpl<_RoutingItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoutingItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoutingItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.remark, remark) || other.remark == remark)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&const DeepCollectionEquality().equals(other._rules, _rules)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.strategy, strategy) || other.strategy == strategy)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,remark,orderIndex,const DeepCollectionEquality().hash(_rules),enabled,strategy,url);

@override
String toString() {
  return 'RoutingItemDto(id: $id, remark: $remark, orderIndex: $orderIndex, rules: $rules, enabled: $enabled, strategy: $strategy, url: $url)';
}


}

/// @nodoc
abstract mixin class _$RoutingItemDtoCopyWith<$Res> implements $RoutingItemDtoCopyWith<$Res> {
  factory _$RoutingItemDtoCopyWith(_RoutingItemDto value, $Res Function(_RoutingItemDto) _then) = __$RoutingItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String remark, int orderIndex, List<RuleItemDto> rules, bool enabled, String strategy, String url
});




}
/// @nodoc
class __$RoutingItemDtoCopyWithImpl<$Res>
    implements _$RoutingItemDtoCopyWith<$Res> {
  __$RoutingItemDtoCopyWithImpl(this._self, this._then);

  final _RoutingItemDto _self;
  final $Res Function(_RoutingItemDto) _then;

/// Create a copy of RoutingItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? remark = null,Object? orderIndex = null,Object? rules = null,Object? enabled = null,Object? strategy = null,Object? url = null,}) {
  return _then(_RoutingItemDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,remark: null == remark ? _self.remark : remark // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,rules: null == rules ? _self._rules : rules // ignore: cast_nullable_to_non_nullable
as List<RuleItemDto>,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,strategy: null == strategy ? _self.strategy : strategy // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
