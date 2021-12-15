import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_dto.freezed.dart';
part 'chat_dto.g.dart';

@freezed
class ChatDto with _$ChatDto {
  const factory ChatDto({
    @JsonKey() required String id,
    @JsonKey() @Default('') String title,
    @JsonKey() required List<String> userIds,
    @JsonKey() @Default([]) List<String> messages,
    @JsonKey() required String createdBy,
    @JsonKey() required DateTime createdAt,
    @JsonKey() DateTime? updatedAt,
    @JsonKey() DateTime? deletedAt,
  }) = _ChatDto;

  factory ChatDto.fromJson(Map<String, dynamic> json) => _$ChatDtoFromJson(json);
}
