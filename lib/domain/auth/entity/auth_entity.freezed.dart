// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthValueObjectTearOff {
  const _$AuthValueObjectTearOff();

  _AuthValueObject call({required bool authenticatedSuccessfully}) {
    return _AuthValueObject(
      authenticatedSuccessfully: authenticatedSuccessfully,
    );
  }
}

/// @nodoc
const $AuthValueObject = _$AuthValueObjectTearOff();

/// @nodoc
mixin _$AuthValueObject {
  bool get authenticatedSuccessfully => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthValueObjectCopyWith<AuthValueObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthValueObjectCopyWith<$Res> {
  factory $AuthValueObjectCopyWith(
          AuthValueObject value, $Res Function(AuthValueObject) then) =
      _$AuthValueObjectCopyWithImpl<$Res>;
  $Res call({bool authenticatedSuccessfully});
}

/// @nodoc
class _$AuthValueObjectCopyWithImpl<$Res>
    implements $AuthValueObjectCopyWith<$Res> {
  _$AuthValueObjectCopyWithImpl(this._value, this._then);

  final AuthValueObject _value;
  // ignore: unused_field
  final $Res Function(AuthValueObject) _then;

  @override
  $Res call({
    Object? authenticatedSuccessfully = freezed,
  }) {
    return _then(_value.copyWith(
      authenticatedSuccessfully: authenticatedSuccessfully == freezed
          ? _value.authenticatedSuccessfully
          : authenticatedSuccessfully // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$AuthValueObjectCopyWith<$Res>
    implements $AuthValueObjectCopyWith<$Res> {
  factory _$AuthValueObjectCopyWith(
          _AuthValueObject value, $Res Function(_AuthValueObject) then) =
      __$AuthValueObjectCopyWithImpl<$Res>;
  @override
  $Res call({bool authenticatedSuccessfully});
}

/// @nodoc
class __$AuthValueObjectCopyWithImpl<$Res>
    extends _$AuthValueObjectCopyWithImpl<$Res>
    implements _$AuthValueObjectCopyWith<$Res> {
  __$AuthValueObjectCopyWithImpl(
      _AuthValueObject _value, $Res Function(_AuthValueObject) _then)
      : super(_value, (v) => _then(v as _AuthValueObject));

  @override
  _AuthValueObject get _value => super._value as _AuthValueObject;

  @override
  $Res call({
    Object? authenticatedSuccessfully = freezed,
  }) {
    return _then(_AuthValueObject(
      authenticatedSuccessfully: authenticatedSuccessfully == freezed
          ? _value.authenticatedSuccessfully
          : authenticatedSuccessfully // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AuthValueObject implements _AuthValueObject {
  const _$_AuthValueObject({required this.authenticatedSuccessfully});

  @override
  final bool authenticatedSuccessfully;

  @override
  String toString() {
    return 'AuthValueObject(authenticatedSuccessfully: $authenticatedSuccessfully)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthValueObject &&
            (identical(other.authenticatedSuccessfully,
                    authenticatedSuccessfully) ||
                other.authenticatedSuccessfully == authenticatedSuccessfully));
  }

  @override
  int get hashCode => Object.hash(runtimeType, authenticatedSuccessfully);

  @JsonKey(ignore: true)
  @override
  _$AuthValueObjectCopyWith<_AuthValueObject> get copyWith =>
      __$AuthValueObjectCopyWithImpl<_AuthValueObject>(this, _$identity);
}

abstract class _AuthValueObject implements AuthValueObject {
  const factory _AuthValueObject({required bool authenticatedSuccessfully}) =
      _$_AuthValueObject;

  @override
  bool get authenticatedSuccessfully;
  @override
  @JsonKey(ignore: true)
  _$AuthValueObjectCopyWith<_AuthValueObject> get copyWith =>
      throw _privateConstructorUsedError;
}
