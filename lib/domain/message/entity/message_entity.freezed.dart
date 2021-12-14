// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'message_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MessageValueObjectTearOff {
  const _$MessageValueObjectTearOff();

  _MessageValueObject call(
      {required String id,
      required String text,
      required String createdBy,
      required DateTime createdAt,
      bool isEdited = false,
      bool isDeleted = false}) {
    return _MessageValueObject(
      id: id,
      text: text,
      createdBy: createdBy,
      createdAt: createdAt,
      isEdited: isEdited,
      isDeleted: isDeleted,
    );
  }
}

/// @nodoc
const $MessageValueObject = _$MessageValueObjectTearOff();

/// @nodoc
mixin _$MessageValueObject {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  bool get isEdited => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MessageValueObjectCopyWith<MessageValueObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageValueObjectCopyWith<$Res> {
  factory $MessageValueObjectCopyWith(
          MessageValueObject value, $Res Function(MessageValueObject) then) =
      _$MessageValueObjectCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String text,
      String createdBy,
      DateTime createdAt,
      bool isEdited,
      bool isDeleted});
}

/// @nodoc
class _$MessageValueObjectCopyWithImpl<$Res>
    implements $MessageValueObjectCopyWith<$Res> {
  _$MessageValueObjectCopyWithImpl(this._value, this._then);

  final MessageValueObject _value;
  // ignore: unused_field
  final $Res Function(MessageValueObject) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? createdBy = freezed,
    Object? createdAt = freezed,
    Object? isEdited = freezed,
    Object? isDeleted = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: createdBy == freezed
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isEdited: isEdited == freezed
          ? _value.isEdited
          : isEdited // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleted: isDeleted == freezed
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$MessageValueObjectCopyWith<$Res>
    implements $MessageValueObjectCopyWith<$Res> {
  factory _$MessageValueObjectCopyWith(
          _MessageValueObject value, $Res Function(_MessageValueObject) then) =
      __$MessageValueObjectCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String text,
      String createdBy,
      DateTime createdAt,
      bool isEdited,
      bool isDeleted});
}

/// @nodoc
class __$MessageValueObjectCopyWithImpl<$Res>
    extends _$MessageValueObjectCopyWithImpl<$Res>
    implements _$MessageValueObjectCopyWith<$Res> {
  __$MessageValueObjectCopyWithImpl(
      _MessageValueObject _value, $Res Function(_MessageValueObject) _then)
      : super(_value, (v) => _then(v as _MessageValueObject));

  @override
  _MessageValueObject get _value => super._value as _MessageValueObject;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? createdBy = freezed,
    Object? createdAt = freezed,
    Object? isEdited = freezed,
    Object? isDeleted = freezed,
  }) {
    return _then(_MessageValueObject(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: createdBy == freezed
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isEdited: isEdited == freezed
          ? _value.isEdited
          : isEdited // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleted: isDeleted == freezed
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MessageValueObject implements _MessageValueObject {
  const _$_MessageValueObject(
      {required this.id,
      required this.text,
      required this.createdBy,
      required this.createdAt,
      this.isEdited = false,
      this.isDeleted = false});

  @override
  final String id;
  @override
  final String text;
  @override
  final String createdBy;
  @override
  final DateTime createdAt;
  @JsonKey(defaultValue: false)
  @override
  final bool isEdited;
  @JsonKey(defaultValue: false)
  @override
  final bool isDeleted;

  @override
  String toString() {
    return 'MessageValueObject(id: $id, text: $text, createdBy: $createdBy, createdAt: $createdAt, isEdited: $isEdited, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MessageValueObject &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.text, text) &&
            const DeepCollectionEquality().equals(other.createdBy, createdBy) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.isEdited, isEdited) &&
            const DeepCollectionEquality().equals(other.isDeleted, isDeleted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(createdBy),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(isEdited),
      const DeepCollectionEquality().hash(isDeleted));

  @JsonKey(ignore: true)
  @override
  _$MessageValueObjectCopyWith<_MessageValueObject> get copyWith =>
      __$MessageValueObjectCopyWithImpl<_MessageValueObject>(this, _$identity);
}

abstract class _MessageValueObject implements MessageValueObject {
  const factory _MessageValueObject(
      {required String id,
      required String text,
      required String createdBy,
      required DateTime createdAt,
      bool isEdited,
      bool isDeleted}) = _$_MessageValueObject;

  @override
  String get id;
  @override
  String get text;
  @override
  String get createdBy;
  @override
  DateTime get createdAt;
  @override
  bool get isEdited;
  @override
  bool get isDeleted;
  @override
  @JsonKey(ignore: true)
  _$MessageValueObjectCopyWith<_MessageValueObject> get copyWith =>
      throw _privateConstructorUsedError;
}
