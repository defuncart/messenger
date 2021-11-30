// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'verification_code_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$VerificationCodeValueObjectTearOff {
  const _$VerificationCodeValueObjectTearOff();

  _VerificationCodeValueObject call({required String id}) {
    return _VerificationCodeValueObject(
      id: id,
    );
  }
}

/// @nodoc
const $VerificationCodeValueObject = _$VerificationCodeValueObjectTearOff();

/// @nodoc
mixin _$VerificationCodeValueObject {
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VerificationCodeValueObjectCopyWith<VerificationCodeValueObject>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationCodeValueObjectCopyWith<$Res> {
  factory $VerificationCodeValueObjectCopyWith(
          VerificationCodeValueObject value,
          $Res Function(VerificationCodeValueObject) then) =
      _$VerificationCodeValueObjectCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class _$VerificationCodeValueObjectCopyWithImpl<$Res>
    implements $VerificationCodeValueObjectCopyWith<$Res> {
  _$VerificationCodeValueObjectCopyWithImpl(this._value, this._then);

  final VerificationCodeValueObject _value;
  // ignore: unused_field
  final $Res Function(VerificationCodeValueObject) _then;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$VerificationCodeValueObjectCopyWith<$Res>
    implements $VerificationCodeValueObjectCopyWith<$Res> {
  factory _$VerificationCodeValueObjectCopyWith(
          _VerificationCodeValueObject value,
          $Res Function(_VerificationCodeValueObject) then) =
      __$VerificationCodeValueObjectCopyWithImpl<$Res>;
  @override
  $Res call({String id});
}

/// @nodoc
class __$VerificationCodeValueObjectCopyWithImpl<$Res>
    extends _$VerificationCodeValueObjectCopyWithImpl<$Res>
    implements _$VerificationCodeValueObjectCopyWith<$Res> {
  __$VerificationCodeValueObjectCopyWithImpl(
      _VerificationCodeValueObject _value,
      $Res Function(_VerificationCodeValueObject) _then)
      : super(_value, (v) => _then(v as _VerificationCodeValueObject));

  @override
  _VerificationCodeValueObject get _value =>
      super._value as _VerificationCodeValueObject;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_VerificationCodeValueObject(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_VerificationCodeValueObject implements _VerificationCodeValueObject {
  const _$_VerificationCodeValueObject({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'VerificationCodeValueObject(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VerificationCodeValueObject &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  _$VerificationCodeValueObjectCopyWith<_VerificationCodeValueObject>
      get copyWith => __$VerificationCodeValueObjectCopyWithImpl<
          _VerificationCodeValueObject>(this, _$identity);
}

abstract class _VerificationCodeValueObject
    implements VerificationCodeValueObject {
  const factory _VerificationCodeValueObject({required String id}) =
      _$_VerificationCodeValueObject;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$VerificationCodeValueObjectCopyWith<_VerificationCodeValueObject>
      get copyWith => throw _privateConstructorUsedError;
}
