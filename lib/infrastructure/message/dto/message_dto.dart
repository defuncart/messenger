import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_dto.freezed.dart';
part 'message_dto.g.dart';

@freezed
class MessageDto with _$MessageDto {
  const factory MessageDto({
    @JsonKey() required String id,
    @JsonKey() required String text,
    @JsonKey() required DateTime createdAt,
    @JsonKey() DateTime? updatedAt,
    @JsonKey() DateTime? deletedAt,
  }) = _MessageDto;

  factory MessageDto.fromJson(Map<String, dynamic> json) => _$MessageDtoFromJson(json);
}
