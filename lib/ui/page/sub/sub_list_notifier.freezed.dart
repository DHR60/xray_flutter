// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_list_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SubListState {

 List<SubItemDto> get subList; String get activeSubId;
/// Create a copy of SubListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubListStateCopyWith<SubListState> get copyWith => _$SubListStateCopyWithImpl<SubListState>(this as SubListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubListState&&const DeepCollectionEquality().equals(other.subList, subList)&&(identical(other.activeSubId, activeSubId) || other.activeSubId == activeSubId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(subList),activeSubId);

@override
String toString() {
  return 'SubListState(subList: $subList, activeSubId: $activeSubId)';
}


}

/// @nodoc
abstract mixin class $SubListStateCopyWith<$Res>  {
  factory $SubListStateCopyWith(SubListState value, $Res Function(SubListState) _then) = _$SubListStateCopyWithImpl;
@useResult
$Res call({
 List<SubItemDto> subList, String activeSubId
});




}
/// @nodoc
class _$SubListStateCopyWithImpl<$Res>
    implements $SubListStateCopyWith<$Res> {
  _$SubListStateCopyWithImpl(this._self, this._then);

  final SubListState _self;
  final $Res Function(SubListState) _then;

/// Create a copy of SubListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subList = null,Object? activeSubId = null,}) {
  return _then(_self.copyWith(
subList: null == subList ? _self.subList : subList // ignore: cast_nullable_to_non_nullable
as List<SubItemDto>,activeSubId: null == activeSubId ? _self.activeSubId : activeSubId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SubListState].
extension SubListStatePatterns on SubListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubListState value)  $default,){
final _that = this;
switch (_that) {
case _SubListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubListState value)?  $default,){
final _that = this;
switch (_that) {
case _SubListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SubItemDto> subList,  String activeSubId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubListState() when $default != null:
return $default(_that.subList,_that.activeSubId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SubItemDto> subList,  String activeSubId)  $default,) {final _that = this;
switch (_that) {
case _SubListState():
return $default(_that.subList,_that.activeSubId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SubItemDto> subList,  String activeSubId)?  $default,) {final _that = this;
switch (_that) {
case _SubListState() when $default != null:
return $default(_that.subList,_that.activeSubId);case _:
  return null;

}
}

}

/// @nodoc


class _SubListState implements SubListState {
  const _SubListState({required final  List<SubItemDto> subList, required this.activeSubId}): _subList = subList;
  

 final  List<SubItemDto> _subList;
@override List<SubItemDto> get subList {
  if (_subList is EqualUnmodifiableListView) return _subList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subList);
}

@override final  String activeSubId;

/// Create a copy of SubListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubListStateCopyWith<_SubListState> get copyWith => __$SubListStateCopyWithImpl<_SubListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubListState&&const DeepCollectionEquality().equals(other._subList, _subList)&&(identical(other.activeSubId, activeSubId) || other.activeSubId == activeSubId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_subList),activeSubId);

@override
String toString() {
  return 'SubListState(subList: $subList, activeSubId: $activeSubId)';
}


}

/// @nodoc
abstract mixin class _$SubListStateCopyWith<$Res> implements $SubListStateCopyWith<$Res> {
  factory _$SubListStateCopyWith(_SubListState value, $Res Function(_SubListState) _then) = __$SubListStateCopyWithImpl;
@override @useResult
$Res call({
 List<SubItemDto> subList, String activeSubId
});




}
/// @nodoc
class __$SubListStateCopyWithImpl<$Res>
    implements _$SubListStateCopyWith<$Res> {
  __$SubListStateCopyWithImpl(this._self, this._then);

  final _SubListState _self;
  final $Res Function(_SubListState) _then;

/// Create a copy of SubListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subList = null,Object? activeSubId = null,}) {
  return _then(_SubListState(
subList: null == subList ? _self._subList : subList // ignore: cast_nullable_to_non_nullable
as List<SubItemDto>,activeSubId: null == activeSubId ? _self.activeSubId : activeSubId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
