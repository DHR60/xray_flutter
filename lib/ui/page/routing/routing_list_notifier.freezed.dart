// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'routing_list_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RoutingListState {

 List<RoutingItemDto> get items; String get activeRoutingId;
/// Create a copy of RoutingListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoutingListStateCopyWith<RoutingListState> get copyWith => _$RoutingListStateCopyWithImpl<RoutingListState>(this as RoutingListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoutingListState&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.activeRoutingId, activeRoutingId) || other.activeRoutingId == activeRoutingId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),activeRoutingId);

@override
String toString() {
  return 'RoutingListState(items: $items, activeRoutingId: $activeRoutingId)';
}


}

/// @nodoc
abstract mixin class $RoutingListStateCopyWith<$Res>  {
  factory $RoutingListStateCopyWith(RoutingListState value, $Res Function(RoutingListState) _then) = _$RoutingListStateCopyWithImpl;
@useResult
$Res call({
 List<RoutingItemDto> items, String activeRoutingId
});




}
/// @nodoc
class _$RoutingListStateCopyWithImpl<$Res>
    implements $RoutingListStateCopyWith<$Res> {
  _$RoutingListStateCopyWithImpl(this._self, this._then);

  final RoutingListState _self;
  final $Res Function(RoutingListState) _then;

/// Create a copy of RoutingListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? activeRoutingId = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<RoutingItemDto>,activeRoutingId: null == activeRoutingId ? _self.activeRoutingId : activeRoutingId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RoutingListState].
extension RoutingListStatePatterns on RoutingListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoutingListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoutingListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoutingListState value)  $default,){
final _that = this;
switch (_that) {
case _RoutingListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoutingListState value)?  $default,){
final _that = this;
switch (_that) {
case _RoutingListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<RoutingItemDto> items,  String activeRoutingId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoutingListState() when $default != null:
return $default(_that.items,_that.activeRoutingId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<RoutingItemDto> items,  String activeRoutingId)  $default,) {final _that = this;
switch (_that) {
case _RoutingListState():
return $default(_that.items,_that.activeRoutingId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<RoutingItemDto> items,  String activeRoutingId)?  $default,) {final _that = this;
switch (_that) {
case _RoutingListState() when $default != null:
return $default(_that.items,_that.activeRoutingId);case _:
  return null;

}
}

}

/// @nodoc


class _RoutingListState implements RoutingListState {
  const _RoutingListState({required final  List<RoutingItemDto> items, required this.activeRoutingId}): _items = items;
  

 final  List<RoutingItemDto> _items;
@override List<RoutingItemDto> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  String activeRoutingId;

/// Create a copy of RoutingListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoutingListStateCopyWith<_RoutingListState> get copyWith => __$RoutingListStateCopyWithImpl<_RoutingListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoutingListState&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.activeRoutingId, activeRoutingId) || other.activeRoutingId == activeRoutingId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),activeRoutingId);

@override
String toString() {
  return 'RoutingListState(items: $items, activeRoutingId: $activeRoutingId)';
}


}

/// @nodoc
abstract mixin class _$RoutingListStateCopyWith<$Res> implements $RoutingListStateCopyWith<$Res> {
  factory _$RoutingListStateCopyWith(_RoutingListState value, $Res Function(_RoutingListState) _then) = __$RoutingListStateCopyWithImpl;
@override @useResult
$Res call({
 List<RoutingItemDto> items, String activeRoutingId
});




}
/// @nodoc
class __$RoutingListStateCopyWithImpl<$Res>
    implements _$RoutingListStateCopyWith<$Res> {
  __$RoutingListStateCopyWithImpl(this._self, this._then);

  final _RoutingListState _self;
  final $Res Function(_RoutingListState) _then;

/// Create a copy of RoutingListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? activeRoutingId = null,}) {
  return _then(_RoutingListState(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<RoutingItemDto>,activeRoutingId: null == activeRoutingId ? _self.activeRoutingId : activeRoutingId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
