// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppConfig {

 UiItemDto get uiItem; StateItemDto get stateItem; List<SubItemDto> get subItems; List<RoutingItemDto> get routingItems; CoreItemDto get coreItem;
/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppConfigCopyWith<AppConfig> get copyWith => _$AppConfigCopyWithImpl<AppConfig>(this as AppConfig, _$identity);

  /// Serializes this AppConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppConfig&&(identical(other.uiItem, uiItem) || other.uiItem == uiItem)&&(identical(other.stateItem, stateItem) || other.stateItem == stateItem)&&const DeepCollectionEquality().equals(other.subItems, subItems)&&const DeepCollectionEquality().equals(other.routingItems, routingItems)&&(identical(other.coreItem, coreItem) || other.coreItem == coreItem));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uiItem,stateItem,const DeepCollectionEquality().hash(subItems),const DeepCollectionEquality().hash(routingItems),coreItem);

@override
String toString() {
  return 'AppConfig(uiItem: $uiItem, stateItem: $stateItem, subItems: $subItems, routingItems: $routingItems, coreItem: $coreItem)';
}


}

/// @nodoc
abstract mixin class $AppConfigCopyWith<$Res>  {
  factory $AppConfigCopyWith(AppConfig value, $Res Function(AppConfig) _then) = _$AppConfigCopyWithImpl;
@useResult
$Res call({
 UiItemDto uiItem, StateItemDto stateItem, List<SubItemDto> subItems, List<RoutingItemDto> routingItems, CoreItemDto coreItem
});


$UiItemDtoCopyWith<$Res> get uiItem;$StateItemDtoCopyWith<$Res> get stateItem;$CoreItemDtoCopyWith<$Res> get coreItem;

}
/// @nodoc
class _$AppConfigCopyWithImpl<$Res>
    implements $AppConfigCopyWith<$Res> {
  _$AppConfigCopyWithImpl(this._self, this._then);

  final AppConfig _self;
  final $Res Function(AppConfig) _then;

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uiItem = null,Object? stateItem = null,Object? subItems = null,Object? routingItems = null,Object? coreItem = null,}) {
  return _then(_self.copyWith(
uiItem: null == uiItem ? _self.uiItem : uiItem // ignore: cast_nullable_to_non_nullable
as UiItemDto,stateItem: null == stateItem ? _self.stateItem : stateItem // ignore: cast_nullable_to_non_nullable
as StateItemDto,subItems: null == subItems ? _self.subItems : subItems // ignore: cast_nullable_to_non_nullable
as List<SubItemDto>,routingItems: null == routingItems ? _self.routingItems : routingItems // ignore: cast_nullable_to_non_nullable
as List<RoutingItemDto>,coreItem: null == coreItem ? _self.coreItem : coreItem // ignore: cast_nullable_to_non_nullable
as CoreItemDto,
  ));
}
/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UiItemDtoCopyWith<$Res> get uiItem {
  
  return $UiItemDtoCopyWith<$Res>(_self.uiItem, (value) {
    return _then(_self.copyWith(uiItem: value));
  });
}/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StateItemDtoCopyWith<$Res> get stateItem {
  
  return $StateItemDtoCopyWith<$Res>(_self.stateItem, (value) {
    return _then(_self.copyWith(stateItem: value));
  });
}/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoreItemDtoCopyWith<$Res> get coreItem {
  
  return $CoreItemDtoCopyWith<$Res>(_self.coreItem, (value) {
    return _then(_self.copyWith(coreItem: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppConfig].
extension AppConfigPatterns on AppConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppConfig value)  $default,){
final _that = this;
switch (_that) {
case _AppConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppConfig value)?  $default,){
final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UiItemDto uiItem,  StateItemDto stateItem,  List<SubItemDto> subItems,  List<RoutingItemDto> routingItems,  CoreItemDto coreItem)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
return $default(_that.uiItem,_that.stateItem,_that.subItems,_that.routingItems,_that.coreItem);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UiItemDto uiItem,  StateItemDto stateItem,  List<SubItemDto> subItems,  List<RoutingItemDto> routingItems,  CoreItemDto coreItem)  $default,) {final _that = this;
switch (_that) {
case _AppConfig():
return $default(_that.uiItem,_that.stateItem,_that.subItems,_that.routingItems,_that.coreItem);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UiItemDto uiItem,  StateItemDto stateItem,  List<SubItemDto> subItems,  List<RoutingItemDto> routingItems,  CoreItemDto coreItem)?  $default,) {final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
return $default(_that.uiItem,_that.stateItem,_that.subItems,_that.routingItems,_that.coreItem);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppConfig implements AppConfig {
  const _AppConfig({this.uiItem = const UiItemDto(), this.stateItem = const StateItemDto(), final  List<SubItemDto> subItems = const <SubItemDto>[], final  List<RoutingItemDto> routingItems = const <RoutingItemDto>[], this.coreItem = const CoreItemDto()}): _subItems = subItems,_routingItems = routingItems;
  factory _AppConfig.fromJson(Map<String, dynamic> json) => _$AppConfigFromJson(json);

@override@JsonKey() final  UiItemDto uiItem;
@override@JsonKey() final  StateItemDto stateItem;
 final  List<SubItemDto> _subItems;
@override@JsonKey() List<SubItemDto> get subItems {
  if (_subItems is EqualUnmodifiableListView) return _subItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subItems);
}

 final  List<RoutingItemDto> _routingItems;
@override@JsonKey() List<RoutingItemDto> get routingItems {
  if (_routingItems is EqualUnmodifiableListView) return _routingItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_routingItems);
}

@override@JsonKey() final  CoreItemDto coreItem;

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppConfigCopyWith<_AppConfig> get copyWith => __$AppConfigCopyWithImpl<_AppConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppConfig&&(identical(other.uiItem, uiItem) || other.uiItem == uiItem)&&(identical(other.stateItem, stateItem) || other.stateItem == stateItem)&&const DeepCollectionEquality().equals(other._subItems, _subItems)&&const DeepCollectionEquality().equals(other._routingItems, _routingItems)&&(identical(other.coreItem, coreItem) || other.coreItem == coreItem));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uiItem,stateItem,const DeepCollectionEquality().hash(_subItems),const DeepCollectionEquality().hash(_routingItems),coreItem);

@override
String toString() {
  return 'AppConfig(uiItem: $uiItem, stateItem: $stateItem, subItems: $subItems, routingItems: $routingItems, coreItem: $coreItem)';
}


}

/// @nodoc
abstract mixin class _$AppConfigCopyWith<$Res> implements $AppConfigCopyWith<$Res> {
  factory _$AppConfigCopyWith(_AppConfig value, $Res Function(_AppConfig) _then) = __$AppConfigCopyWithImpl;
@override @useResult
$Res call({
 UiItemDto uiItem, StateItemDto stateItem, List<SubItemDto> subItems, List<RoutingItemDto> routingItems, CoreItemDto coreItem
});


@override $UiItemDtoCopyWith<$Res> get uiItem;@override $StateItemDtoCopyWith<$Res> get stateItem;@override $CoreItemDtoCopyWith<$Res> get coreItem;

}
/// @nodoc
class __$AppConfigCopyWithImpl<$Res>
    implements _$AppConfigCopyWith<$Res> {
  __$AppConfigCopyWithImpl(this._self, this._then);

  final _AppConfig _self;
  final $Res Function(_AppConfig) _then;

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uiItem = null,Object? stateItem = null,Object? subItems = null,Object? routingItems = null,Object? coreItem = null,}) {
  return _then(_AppConfig(
uiItem: null == uiItem ? _self.uiItem : uiItem // ignore: cast_nullable_to_non_nullable
as UiItemDto,stateItem: null == stateItem ? _self.stateItem : stateItem // ignore: cast_nullable_to_non_nullable
as StateItemDto,subItems: null == subItems ? _self._subItems : subItems // ignore: cast_nullable_to_non_nullable
as List<SubItemDto>,routingItems: null == routingItems ? _self._routingItems : routingItems // ignore: cast_nullable_to_non_nullable
as List<RoutingItemDto>,coreItem: null == coreItem ? _self.coreItem : coreItem // ignore: cast_nullable_to_non_nullable
as CoreItemDto,
  ));
}

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UiItemDtoCopyWith<$Res> get uiItem {
  
  return $UiItemDtoCopyWith<$Res>(_self.uiItem, (value) {
    return _then(_self.copyWith(uiItem: value));
  });
}/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StateItemDtoCopyWith<$Res> get stateItem {
  
  return $StateItemDtoCopyWith<$Res>(_self.stateItem, (value) {
    return _then(_self.copyWith(stateItem: value));
  });
}/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoreItemDtoCopyWith<$Res> get coreItem {
  
  return $CoreItemDtoCopyWith<$Res>(_self.coreItem, (value) {
    return _then(_self.copyWith(coreItem: value));
  });
}
}

// dart format on
