// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatDto _$ChatDtoFromJson(Map<String, dynamic> json) {
  return _ChatDto.fromJson(json);
}

/// @nodoc
class _$ChatDtoTearOff {
  const _$ChatDtoTearOff();

  _ChatDto call(
      {@JsonKey() required String id,
      @JsonKey() String title = '',
      @JsonKey() required List<String> userIds,
      @JsonKey() List<String> messages = const [],
      @JsonKey() required String createdBy,
      @JsonKey() required DateTime createdAt,
      @JsonKey() DateTime? updatedAt,
      @JsonKey() DateTime? deletedAt}) {
    return _ChatDto(
      id: id,
      title: title,
      userIds: userIds,
      messages: messages,
      createdBy: createdBy,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
    );
  }

  ChatDto fromJson(Map<String, Object?> json) {
    return ChatDto.fromJson(json);
  }
}

/// @nodoc
const $ChatDto = _$ChatDtoTearOff();

/// @nodoc
mixin _$ChatDto {
  @JsonKey()
  String get id => throw _privateConstructorUsedError;
  @JsonKey()
  String get title => throw _privateConstructorUsedError;
  @JsonKey()
  List<String> get userIds => throw _privateConstructorUsedError;
  @JsonKey()
  List<String> get messages => throw _privateConstructorUsedError;
  @JsonKey()
  String get createdBy => throw _privateConstructorUsedError;
  @JsonKey()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey()
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatDtoCopyWith<ChatDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatDtoCopyWith<$Res> {
  factory $ChatDtoCopyWith(ChatDto value, $Res Function(ChatDto) then) =
      _$ChatDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey() String id,
      @JsonKey() String title,
      @JsonKey() List<String> userIds,
      @JsonKey() List<String> messages,
      @JsonKey() String createdBy,
      @JsonKey() DateTime createdAt,
      @JsonKey() DateTime? updatedAt,
      @JsonKey() DateTime? deletedAt});
}

/// @nodoc
class _$ChatDtoCopyWithImpl<$Res> implements $ChatDtoCopyWith<$Res> {
  _$ChatDtoCopyWithImpl(this._value, this._then);

  final ChatDto _value;
  // ignore: unused_field
  final $Res Function(ChatDto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? userIds = freezed,
    Object? messages = freezed,
    Object? createdBy = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
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
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: deletedAt == freezed
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$ChatDtoCopyWith<$Res> implements $ChatDtoCopyWith<$Res> {
  factory _$ChatDtoCopyWith(_ChatDto value, $Res Function(_ChatDto) then) =
      __$ChatDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey() String id,
      @JsonKey() String title,
      @JsonKey() List<String> userIds,
      @JsonKey() List<String> messages,
      @JsonKey() String createdBy,
      @JsonKey() DateTime createdAt,
      @JsonKey() DateTime? updatedAt,
      @JsonKey() DateTime? deletedAt});
}

/// @nodoc
class __$ChatDtoCopyWithImpl<$Res> extends _$ChatDtoCopyWithImpl<$Res>
    implements _$ChatDtoCopyWith<$Res> {
  __$ChatDtoCopyWithImpl(_ChatDto _value, $Res Function(_ChatDto) _then)
      : super(_value, (v) => _then(v as _ChatDto));

  @override
  _ChatDto get _value => super._value as _ChatDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? userIds = freezed,
    Object? messages = freezed,
    Object? createdBy = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_ChatDto(
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
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: deletedAt == freezed
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatDto implements _ChatDto {
  const _$_ChatDto(
      {@JsonKey() required this.id,
      @JsonKey() this.title = '',
      @JsonKey() required this.userIds,
      @JsonKey() this.messages = const [],
      @JsonKey() required this.createdBy,
      @JsonKey() required this.createdAt,
      @JsonKey() this.updatedAt,
      @JsonKey() this.deletedAt});

  factory _$_ChatDto.fromJson(Map<String, dynamic> json) =>
      _$$_ChatDtoFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final List<String> userIds;
  @override
  @JsonKey()
  final List<String> messages;
  @override
  @JsonKey()
  final String createdBy;
  @override
  @JsonKey()
  final DateTime createdAt;
  @override
  @JsonKey()
  final DateTime? updatedAt;
  @override
  @JsonKey()
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'ChatDto(id: $id, title: $title, userIds: $userIds, messages: $messages, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.userIds, userIds) &&
            const DeepCollectionEquality().equals(other.messages, messages) &&
            const DeepCollectionEquality().equals(other.createdBy, createdBy) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.deletedAt, deletedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(userIds),
      const DeepCollectionEquality().hash(messages),
      const DeepCollectionEquality().hash(createdBy),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(deletedAt));

  @JsonKey(ignore: true)
  @override
  _$ChatDtoCopyWith<_ChatDto> get copyWith =>
      __$ChatDtoCopyWithImpl<_ChatDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatDtoToJson(this);
  }
}

abstract class _ChatDto implements ChatDto {
  const factory _ChatDto(
      {@JsonKey() required String id,
      @JsonKey() String title,
      @JsonKey() required List<String> userIds,
      @JsonKey() List<String> messages,
      @JsonKey() required String createdBy,
      @JsonKey() required DateTime createdAt,
      @JsonKey() DateTime? updatedAt,
      @JsonKey() DateTime? deletedAt}) = _$_ChatDto;

  factory _ChatDto.fromJson(Map<String, dynamic> json) = _$_ChatDto.fromJson;

  @override
  @JsonKey()
  String get id;
  @override
  @JsonKey()
  String get title;
  @override
  @JsonKey()
  List<String> get userIds;
  @override
  @JsonKey()
  List<String> get messages;
  @override
  @JsonKey()
  String get createdBy;
  @override
  @JsonKey()
  DateTime get createdAt;
  @override
  @JsonKey()
  DateTime? get updatedAt;
  @override
  @JsonKey()
  DateTime? get deletedAt;
  @override
  @JsonKey(ignore: true)
  _$ChatDtoCopyWith<_ChatDto> get copyWith =>
      throw _privateConstructorUsedError;
}
