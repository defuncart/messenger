// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessageDto _$$_MessageDtoFromJson(Map<String, dynamic> json) =>
    _$_MessageDto(
      id: json['id'] as String,
      text: json['text'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$$_MessageDtoToJson(_$_MessageDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
