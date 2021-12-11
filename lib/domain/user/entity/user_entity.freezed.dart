// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserValueObjectTearOff {
  const _$UserValueObjectTearOff();

  _UserValueObject call(
      {required String id,
      required String phoneNumber,
      required String displayName,
      String? avatarUrl}) {
    return _UserValueObject(
      id: id,
      phoneNumber: phoneNumber,
      displayName: displayName,
      avatarUrl: avatarUrl,
    );
  }
}

/// @nodoc
const $UserValueObject = _$UserValueObjectTearOff();

/// @nodoc
mixin _$UserValueObject {
  String get id => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserValueObjectCopyWith<UserValueObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserValueObjectCopyWith<$Res> {
  factory $UserValueObjectCopyWith(
          UserValueObject value, $Res Function(UserValueObject) then) =
      _$UserValueObjectCopyWithImpl<$Res>;
  $Res call(
      {String id, String phoneNumber, String displayName, String? avatarUrl});
}

/// @nodoc
class _$UserValueObjectCopyWithImpl<$Res>
    implements $UserValueObjectCopyWith<$Res> {
  _$UserValueObjectCopyWithImpl(this._value, this._then);

  final UserValueObject _value;
  // ignore: unused_field
  final $Res Function(UserValueObject) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? phoneNumber = freezed,
    Object? displayName = freezed,
    Object? avatarUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: avatarUrl == freezed
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$UserValueObjectCopyWith<$Res>
    implements $UserValueObjectCopyWith<$Res> {
  factory _$UserValueObjectCopyWith(
          _UserValueObject value, $Res Function(_UserValueObject) then) =
      __$UserValueObjectCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id, String phoneNumber, String displayName, String? avatarUrl});
}

/// @nodoc
class __$UserValueObjectCopyWithImpl<$Res>
    extends _$UserValueObjectCopyWithImpl<$Res>
    implements _$UserValueObjectCopyWith<$Res> {
  __$UserValueObjectCopyWithImpl(
      _UserValueObject _value, $Res Function(_UserValueObject) _then)
      : super(_value, (v) => _then(v as _UserValueObject));

  @override
  _UserValueObject get _value => super._value as _UserValueObject;

  @override
  $Res call({
    Object? id = freezed,
    Object? phoneNumber = freezed,
    Object? displayName = freezed,
    Object? avatarUrl = freezed,
  }) {
    return _then(_UserValueObject(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: avatarUrl == freezed
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_UserValueObject implements _UserValueObject {
  const _$_UserValueObject(
      {required this.id,
      required this.phoneNumber,
      required this.displayName,
      this.avatarUrl});

  @override
  final String id;
  @override
  final String phoneNumber;
  @override
  final String displayName;
  @override
  final String? avatarUrl;

  @override
  String toString() {
    return 'UserValueObject(id: $id, phoneNumber: $phoneNumber, displayName: $displayName, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserValueObject &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality()
                .equals(other.displayName, displayName) &&
            const DeepCollectionEquality().equals(other.avatarUrl, avatarUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(displayName),
      const DeepCollectionEquality().hash(avatarUrl));

  @JsonKey(ignore: true)
  @override
  _$UserValueObjectCopyWith<_UserValueObject> get copyWith =>
      __$UserValueObjectCopyWithImpl<_UserValueObject>(this, _$identity);
}

abstract class _UserValueObject implements UserValueObject {
  const factory _UserValueObject(
      {required String id,
      required String phoneNumber,
      required String displayName,
      String? avatarUrl}) = _$_UserValueObject;

  @override
  String get id;
  @override
  String get phoneNumber;
  @override
  String get displayName;
  @override
  String? get avatarUrl;
  @override
  @JsonKey(ignore: true)
  _$UserValueObjectCopyWith<_UserValueObject> get copyWith =>
      throw _privateConstructorUsedError;
}
