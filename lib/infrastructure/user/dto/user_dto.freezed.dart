// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserDto _$UserDtoFromJson(Map<String, dynamic> json) {
  return _UserDto.fromJson(json);
}

/// @nodoc
class _$UserDtoTearOff {
  const _$UserDtoTearOff();

  _UserDto call(
      {@JsonKey() required String id,
      @JsonKey() required String phoneNumber,
      @JsonKey() required String displayName,
      @JsonKey() String? avatarUrl,
      @JsonKey() required DateTime createdAt,
      @JsonKey() required DateTime updatedAt}) {
    return _UserDto(
      id: id,
      phoneNumber: phoneNumber,
      displayName: displayName,
      avatarUrl: avatarUrl,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  UserDto fromJson(Map<String, Object?> json) {
    return UserDto.fromJson(json);
  }
}

/// @nodoc
const $UserDto = _$UserDtoTearOff();

/// @nodoc
mixin _$UserDto {
  @JsonKey()
  String get id => throw _privateConstructorUsedError;
  @JsonKey()
  String get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey()
  String get displayName => throw _privateConstructorUsedError;
  @JsonKey()
  String? get avatarUrl => throw _privateConstructorUsedError;
  @JsonKey()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey()
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDtoCopyWith<UserDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDtoCopyWith<$Res> {
  factory $UserDtoCopyWith(UserDto value, $Res Function(UserDto) then) =
      _$UserDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey() String id,
      @JsonKey() String phoneNumber,
      @JsonKey() String displayName,
      @JsonKey() String? avatarUrl,
      @JsonKey() DateTime createdAt,
      @JsonKey() DateTime updatedAt});
}

/// @nodoc
class _$UserDtoCopyWithImpl<$Res> implements $UserDtoCopyWith<$Res> {
  _$UserDtoCopyWithImpl(this._value, this._then);

  final UserDto _value;
  // ignore: unused_field
  final $Res Function(UserDto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? phoneNumber = freezed,
    Object? displayName = freezed,
    Object? avatarUrl = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$UserDtoCopyWith<$Res> implements $UserDtoCopyWith<$Res> {
  factory _$UserDtoCopyWith(_UserDto value, $Res Function(_UserDto) then) =
      __$UserDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey() String id,
      @JsonKey() String phoneNumber,
      @JsonKey() String displayName,
      @JsonKey() String? avatarUrl,
      @JsonKey() DateTime createdAt,
      @JsonKey() DateTime updatedAt});
}

/// @nodoc
class __$UserDtoCopyWithImpl<$Res> extends _$UserDtoCopyWithImpl<$Res>
    implements _$UserDtoCopyWith<$Res> {
  __$UserDtoCopyWithImpl(_UserDto _value, $Res Function(_UserDto) _then)
      : super(_value, (v) => _then(v as _UserDto));

  @override
  _UserDto get _value => super._value as _UserDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? phoneNumber = freezed,
    Object? displayName = freezed,
    Object? avatarUrl = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_UserDto(
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
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserDto implements _UserDto {
  const _$_UserDto(
      {@JsonKey() required this.id,
      @JsonKey() required this.phoneNumber,
      @JsonKey() required this.displayName,
      @JsonKey() this.avatarUrl,
      @JsonKey() required this.createdAt,
      @JsonKey() required this.updatedAt});

  factory _$_UserDto.fromJson(Map<String, dynamic> json) =>
      _$$_UserDtoFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String phoneNumber;
  @override
  @JsonKey()
  final String displayName;
  @override
  @JsonKey()
  final String? avatarUrl;
  @override
  @JsonKey()
  final DateTime createdAt;
  @override
  @JsonKey()
  final DateTime updatedAt;

  @override
  String toString() {
    return 'UserDto(id: $id, phoneNumber: $phoneNumber, displayName: $displayName, avatarUrl: $avatarUrl, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality()
                .equals(other.displayName, displayName) &&
            const DeepCollectionEquality().equals(other.avatarUrl, avatarUrl) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(displayName),
      const DeepCollectionEquality().hash(avatarUrl),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  _$UserDtoCopyWith<_UserDto> get copyWith =>
      __$UserDtoCopyWithImpl<_UserDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDtoToJson(this);
  }
}

abstract class _UserDto implements UserDto {
  const factory _UserDto(
      {@JsonKey() required String id,
      @JsonKey() required String phoneNumber,
      @JsonKey() required String displayName,
      @JsonKey() String? avatarUrl,
      @JsonKey() required DateTime createdAt,
      @JsonKey() required DateTime updatedAt}) = _$_UserDto;

  factory _UserDto.fromJson(Map<String, dynamic> json) = _$_UserDto.fromJson;

  @override
  @JsonKey()
  String get id;
  @override
  @JsonKey()
  String get phoneNumber;
  @override
  @JsonKey()
  String get displayName;
  @override
  @JsonKey()
  String? get avatarUrl;
  @override
  @JsonKey()
  DateTime get createdAt;
  @override
  @JsonKey()
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$UserDtoCopyWith<_UserDto> get copyWith =>
      throw _privateConstructorUsedError;
}
