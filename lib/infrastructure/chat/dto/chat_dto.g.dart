// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatDto _$$_ChatDtoFromJson(Map<String, dynamic> json) => _$_ChatDto(
      id: json['id'] as String,
      title: json['title'] as String? ?? '',
      userIds:
          (json['userIds'] as List<dynamic>).map((e) => e as String).toList(),
      messages: (json['messages'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdBy: json['createdBy'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$$_ChatDtoToJson(_$_ChatDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'userIds': instance.userIds,
      'messages': instance.messages,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
