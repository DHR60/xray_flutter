// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileContext {

 ProfileItemData get profile; RoutingItemDto? get routingItem; CoreItemDto? get coreItem;
/// Create a copy of ProfileContext
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileContextCopyWith<ProfileContext> get copyWith => _$ProfileContextCopyWithImpl<ProfileContext>(this as ProfileContext, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileContext&&const DeepCollectionEquality().equals(other.profile, profile)&&(identical(other.routingItem, routingItem) || other.routingItem == routingItem)&&(identical(other.coreItem, coreItem) || other.coreItem == coreItem));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(profile),routingItem,coreItem);

@override
String toString() {
  return 'ProfileContext(profile: $profile, routingItem: $routingItem, coreItem: $coreItem)';
}


}

/// @nodoc
abstract mixin class $ProfileContextCopyWith<$Res>  {
  factory $ProfileContextCopyWith(ProfileContext value, $Res Function(ProfileContext) _then) = _$ProfileContextCopyWithImpl;
@useResult
$Res call({
 ProfileItemData profile, RoutingItemDto? routingItem, CoreItemDto? coreItem
});


$RoutingItemDtoCopyWith<$Res>? get routingItem;$CoreItemDtoCopyWith<$Res>? get coreItem;

}
/// @nodoc
class _$ProfileContextCopyWithImpl<$Res>
    implements $ProfileContextCopyWith<$Res> {
  _$ProfileContextCopyWithImpl(this._self, this._then);

  final ProfileContext _self;
  final $Res Function(ProfileContext) _then;

/// Create a copy of ProfileContext
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profile = freezed,Object? routingItem = freezed,Object? coreItem = freezed,}) {
  return _then(_self.copyWith(
profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as ProfileItemData,routingItem: freezed == routingItem ? _self.routingItem : routingItem // ignore: cast_nullable_to_non_nullable
as RoutingItemDto?,coreItem: freezed == coreItem ? _self.coreItem : coreItem // ignore: cast_nullable_to_non_nullable
as CoreItemDto?,
  ));
}
/// Create a copy of ProfileContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoutingItemDtoCopyWith<$Res>? get routingItem {
    if (_self.routingItem == null) {
    return null;
  }

  return $RoutingItemDtoCopyWith<$Res>(_self.routingItem!, (value) {
    return _then(_self.copyWith(routingItem: value));
  });
}/// Create a copy of ProfileContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoreItemDtoCopyWith<$Res>? get coreItem {
    if (_self.coreItem == null) {
    return null;
  }

  return $CoreItemDtoCopyWith<$Res>(_self.coreItem!, (value) {
    return _then(_self.copyWith(coreItem: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileContext].
extension ProfileContextPatterns on ProfileContext {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileContext value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileContext() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileContext value)  $default,){
final _that = this;
switch (_that) {
case _ProfileContext():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileContext value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileContext() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProfileItemData profile,  RoutingItemDto? routingItem,  CoreItemDto? coreItem)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileContext() when $default != null:
return $default(_that.profile,_that.routingItem,_that.coreItem);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProfileItemData profile,  RoutingItemDto? routingItem,  CoreItemDto? coreItem)  $default,) {final _that = this;
switch (_that) {
case _ProfileContext():
return $default(_that.profile,_that.routingItem,_that.coreItem);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProfileItemData profile,  RoutingItemDto? routingItem,  CoreItemDto? coreItem)?  $default,) {final _that = this;
switch (_that) {
case _ProfileContext() when $default != null:
return $default(_that.profile,_that.routingItem,_that.coreItem);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileContext implements ProfileContext {
  const _ProfileContext({required this.profile, required this.routingItem, required this.coreItem});
  

@override final  ProfileItemData profile;
@override final  RoutingItemDto? routingItem;
@override final  CoreItemDto? coreItem;

/// Create a copy of ProfileContext
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileContextCopyWith<_ProfileContext> get copyWith => __$ProfileContextCopyWithImpl<_ProfileContext>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileContext&&const DeepCollectionEquality().equals(other.profile, profile)&&(identical(other.routingItem, routingItem) || other.routingItem == routingItem)&&(identical(other.coreItem, coreItem) || other.coreItem == coreItem));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(profile),routingItem,coreItem);

@override
String toString() {
  return 'ProfileContext(profile: $profile, routingItem: $routingItem, coreItem: $coreItem)';
}


}

/// @nodoc
abstract mixin class _$ProfileContextCopyWith<$Res> implements $ProfileContextCopyWith<$Res> {
  factory _$ProfileContextCopyWith(_ProfileContext value, $Res Function(_ProfileContext) _then) = __$ProfileContextCopyWithImpl;
@override @useResult
$Res call({
 ProfileItemData profile, RoutingItemDto? routingItem, CoreItemDto? coreItem
});


@override $RoutingItemDtoCopyWith<$Res>? get routingItem;@override $CoreItemDtoCopyWith<$Res>? get coreItem;

}
/// @nodoc
class __$ProfileContextCopyWithImpl<$Res>
    implements _$ProfileContextCopyWith<$Res> {
  __$ProfileContextCopyWithImpl(this._self, this._then);

  final _ProfileContext _self;
  final $Res Function(_ProfileContext) _then;

/// Create a copy of ProfileContext
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profile = freezed,Object? routingItem = freezed,Object? coreItem = freezed,}) {
  return _then(_ProfileContext(
profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as ProfileItemData,routingItem: freezed == routingItem ? _self.routingItem : routingItem // ignore: cast_nullable_to_non_nullable
as RoutingItemDto?,coreItem: freezed == coreItem ? _self.coreItem : coreItem // ignore: cast_nullable_to_non_nullable
as CoreItemDto?,
  ));
}

/// Create a copy of ProfileContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoutingItemDtoCopyWith<$Res>? get routingItem {
    if (_self.routingItem == null) {
    return null;
  }

  return $RoutingItemDtoCopyWith<$Res>(_self.routingItem!, (value) {
    return _then(_self.copyWith(routingItem: value));
  });
}/// Create a copy of ProfileContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoreItemDtoCopyWith<$Res>? get coreItem {
    if (_self.coreItem == null) {
    return null;
  }

  return $CoreItemDtoCopyWith<$Res>(_self.coreItem!, (value) {
    return _then(_self.copyWith(coreItem: value));
  });
}
}

// dart format on
