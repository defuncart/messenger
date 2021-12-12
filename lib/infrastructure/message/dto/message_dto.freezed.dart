// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'message_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MessageDto _$MessageDtoFromJson(Map<String, dynamic> json) {
  return _MessageDto.fromJson(json);
}

/// @nodoc
class _$MessageDtoTearOff {
  const _$MessageDtoTearOff();

  _MessageDto call(
      {@JsonKey() required String id,
      @JsonKey() required String text,
      @JsonKey() required DateTime createdAt,
      @JsonKey() DateTime? updatedAt,
      @JsonKey() DateTime? deletedAt}) {
    return _MessageDto(
      id: id,
      text: text,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
    );
  }

  MessageDto fromJson(Map<String, Object?> json) {
    return MessageDto.fromJson(json);
  }
}

/// @nodoc
const $MessageDto = _$MessageDtoTearOff();

/// @nodoc
mixin _$MessageDto {
  @JsonKey()
  String get id => throw _privateConstructorUsedError;
  @JsonKey()
  String get text => throw _privateConstructorUsedError;
  @JsonKey()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey()
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageDtoCopyWith<MessageDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageDtoCopyWith<$Res> {
  factory $MessageDtoCopyWith(
          MessageDto value, $Res Function(MessageDto) then) =
      _$MessageDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey() String id,
      @JsonKey() String text,
      @JsonKey() DateTime createdAt,
      @JsonKey() DateTime? updatedAt,
      @JsonKey() DateTime? deletedAt});
}

/// @nodoc
class _$MessageDtoCopyWithImpl<$Res> implements $MessageDtoCopyWith<$Res> {
  _$MessageDtoCopyWithImpl(this._value, this._then);

  final MessageDto _value;
  // ignore: unused_field
  final $Res Function(MessageDto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
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
abstract class _$MessageDtoCopyWith<$Res> implements $MessageDtoCopyWith<$Res> {
  factory _$MessageDtoCopyWith(
          _MessageDto value, $Res Function(_MessageDto) then) =
      __$MessageDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey() String id,
      @JsonKey() String text,
      @JsonKey() DateTime createdAt,
      @JsonKey() DateTime? updatedAt,
      @JsonKey() DateTime? deletedAt});
}

/// @nodoc
class __$MessageDtoCopyWithImpl<$Res> extends _$MessageDtoCopyWithImpl<$Res>
    implements _$MessageDtoCopyWith<$Res> {
  __$MessageDtoCopyWithImpl(
      _MessageDto _value, $Res Function(_MessageDto) _then)
      : super(_value, (v) => _then(v as _MessageDto));

  @override
  _MessageDto get _value => super._value as _MessageDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_MessageDto(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
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
class _$_MessageDto implements _MessageDto {
  const _$_MessageDto(
      {@JsonKey() required this.id,
      @JsonKey() required this.text,
      @JsonKey() required this.createdAt,
      @JsonKey() this.updatedAt,
      @JsonKey() this.deletedAt});

  factory _$_MessageDto.fromJson(Map<String, dynamic> json) =>
      _$$_MessageDtoFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String text;
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
    return 'MessageDto(id: $id, text: $text, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MessageDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.text, text) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.deletedAt, deletedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(deletedAt));

  @JsonKey(ignore: true)
  @override
  _$MessageDtoCopyWith<_MessageDto> get copyWith =>
      __$MessageDtoCopyWithImpl<_MessageDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageDtoToJson(this);
  }
}

abstract class _MessageDto implements MessageDto {
  const factory _MessageDto(
      {@JsonKey() required String id,
      @JsonKey() required String text,
      @JsonKey() required DateTime createdAt,
      @JsonKey() DateTime? updatedAt,
      @JsonKey() DateTime? deletedAt}) = _$_MessageDto;

  factory _MessageDto.fromJson(Map<String, dynamic> json) =
      _$_MessageDto.fromJson;

  @override
  @JsonKey()
  String get id;
  @override
  @JsonKey()
  String get text;
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
  _$MessageDtoCopyWith<_MessageDto> get copyWith =>
      throw _privateConstructorUsedError;
}
