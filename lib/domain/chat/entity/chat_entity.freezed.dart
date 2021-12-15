// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ChatValueObjectTearOff {
  const _$ChatValueObjectTearOff();

  _ChatValueObject call(
      {required String id,
      String title = '',
      required List<String> userIds,
      List<String> messages = const [],
      required String createdBy,
      bool isDeleted = false}) {
    return _ChatValueObject(
      id: id,
      title: title,
      userIds: userIds,
      messages: messages,
      createdBy: createdBy,
      isDeleted: isDeleted,
    );
  }
}

/// @nodoc
const $ChatValueObject = _$ChatValueObjectTearOff();

/// @nodoc
mixin _$ChatValueObject {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<String> get userIds => throw _privateConstructorUsedError;
  List<String> get messages => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatValueObjectCopyWith<ChatValueObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatValueObjectCopyWith<$Res> {
  factory $ChatValueObjectCopyWith(
          ChatValueObject value, $Res Function(ChatValueObject) then) =
      _$ChatValueObjectCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String title,
      List<String> userIds,
      List<String> messages,
      String createdBy,
      bool isDeleted});
}

/// @nodoc
class _$ChatValueObjectCopyWithImpl<$Res>
    implements $ChatValueObjectCopyWith<$Res> {
  _$ChatValueObjectCopyWithImpl(this._value, this._then);

  final ChatValueObject _value;
  // ignore: unused_field
  final $Res Function(ChatValueObject) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? userIds = freezed,
    Object? messages = freezed,
    Object? createdBy = freezed,
    Object? isDeleted = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      userIds: userIds == freezed
          ? _value.userIds
          : userIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdBy: createdBy == freezed
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      isDeleted: isDeleted == freezed
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ChatValueObjectCopyWith<$Res>
    implements $ChatValueObjectCopyWith<$Res> {
  factory _$ChatValueObjectCopyWith(
          _ChatValueObject value, $Res Function(_ChatValueObject) then) =
      __$ChatValueObjectCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String title,
      List<String> userIds,
      List<String> messages,
      String createdBy,
      bool isDeleted});
}

/// @nodoc
class __$ChatValueObjectCopyWithImpl<$Res>
    extends _$ChatValueObjectCopyWithImpl<$Res>
    implements _$ChatValueObjectCopyWith<$Res> {
  __$ChatValueObjectCopyWithImpl(
      _ChatValueObject _value, $Res Function(_ChatValueObject) _then)
      : super(_value, (v) => _then(v as _ChatValueObject));

  @override
  _ChatValueObject get _value => super._value as _ChatValueObject;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? userIds = freezed,
    Object? messages = freezed,
    Object? createdBy = freezed,
    Object? isDeleted = freezed,
  }) {
    return _then(_ChatValueObject(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      userIds: userIds == freezed
          ? _value.userIds
          : userIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdBy: createdBy == freezed
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      isDeleted: isDeleted == freezed
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ChatValueObject implements _ChatValueObject {
  const _$_ChatValueObject(
      {required this.id,
      this.title = '',
      required this.userIds,
      this.messages = const [],
      required this.createdBy,
      this.isDeleted = false});

  @override
  final String id;
  @JsonKey(defaultValue: '')
  @override
  final String title;
  @override
  final List<String> userIds;
  @JsonKey(defaultValue: const [])
  @override
  final List<String> messages;
  @override
  final String createdBy;
  @JsonKey(defaultValue: false)
  @override
  final bool isDeleted;

  @override
  String toString() {
    return 'ChatValueObject(id: $id, title: $title, userIds: $userIds, messages: $messages, createdBy: $createdBy, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatValueObject &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.userIds, userIds) &&
            const DeepCollectionEquality().equals(other.messages, messages) &&
            const DeepCollectionEquality().equals(other.createdBy, createdBy) &&
            const DeepCollectionEquality().equals(other.isDeleted, isDeleted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(userIds),
      const DeepCollectionEquality().hash(messages),
      const DeepCollectionEquality().hash(createdBy),
      const DeepCollectionEquality().hash(isDeleted));

  @JsonKey(ignore: true)
  @override
  _$ChatValueObjectCopyWith<_ChatValueObject> get copyWith =>
      __$ChatValueObjectCopyWithImpl<_ChatValueObject>(this, _$identity);
}

abstract class _ChatValueObject implements ChatValueObject {
  const factory _ChatValueObject(
      {required String id,
      String title,
      required List<String> userIds,
      List<String> messages,
      required String createdBy,
      bool isDeleted}) = _$_ChatValueObject;

  @override
  String get id;
  @override
  String get title;
  @override
  List<String> get userIds;
  @override
  List<String> get messages;
  @override
  String get createdBy;
  @override
  bool get isDeleted;
  @override
  @JsonKey(ignore: true)
  _$ChatValueObjectCopyWith<_ChatValueObject> get copyWith =>
      throw _privateConstructorUsedError;
}
