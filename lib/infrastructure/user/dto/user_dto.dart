import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  const factory UserDto({
    @JsonKey() required String id,
    @JsonKey() required String phoneNumber,
    @JsonKey() required String displayName,
    @JsonKey() String? avatarUrl,
    @JsonKey() required DateTime createdAt,
    @JsonKey() required DateTime updatedAt,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);
}
