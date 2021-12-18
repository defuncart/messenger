import 'dart:developer' show log;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messenger/common/repositories/date_time/date_time_generator.dart';
import 'package:messenger/common/repositories/id/id_generator.dart';
import 'package:messenger/domain/message/entity/message_entity.dart';
import 'package:messenger/domain/message/message_repository.dart';
import 'package:messenger/infrastructure/message/dto/message_dto.dart';
import 'package:messenger/infrastructure/message/message_mapper.dart';

class MessageRepositoryImpl implements MessageRepository {
  MessageRepositoryImpl({
    FirebaseFirestore? firebaseFirestore,
    required DateTimeGenerator dateTimeGenerator,
    required IdGenerator idGenerator,
  })  : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance,
        _dateTimeGenerator = dateTimeGenerator,
        _idGenerator = idGenerator;

  final FirebaseFirestore _firebaseFirestore;
  final DateTimeGenerator _dateTimeGenerator;
  final IdGenerator _idGenerator;

  static const _collection = 'messages';

  /// Saves a message to db
  ///
  /// If the message does not exist, it is created, otherwise existing message overwritten
  Future<void> _saveMessage(MessageDto message) async {
    await _firebaseFirestore.collection(_collection).doc(message.id).set(message.toJson());
    log('$MessageRepositoryImpl saved message ${message.toString()}');
  }

  /// Maps [MessageDto] to [MessageEntity]
  MessageEntity _dtoToEntity(MessageDto dto) => MessageEntity.value(dto.toValueObject());

  /// Maps [DocumentSnapshot] to [MessageEntity]
  MessageEntity _snapshotToEntity(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    if (snapshot.exists) {
      try {
        final dto = MessageDto.fromJson(snapshot.data()!);
        return _dtoToEntity(dto);
      } catch (e) {
        return MessageEntity.failure(MessageCouldNotBeParsedFailure());
      }
    }
    return MessageEntity.failure(MessageNotFoundFailure());
  }

  @override
  Future<MessageEntity> createMessage({
    required String text,
    required String createdBy,
  }) async {
    final id = _idGenerator.generate();
    final now = _dateTimeGenerator.nowUtc;
    final message = MessageDto(
      id: id,
      text: text,
      createdBy: createdBy,
      createdAt: now,
    );

    await _saveMessage(message);

    return _dtoToEntity(message);
  }

  @override
  Future<void> updateMessage({required String id, required String text}) async {
    final now = _dateTimeGenerator.nowUtc.toIso8601String();
    await _firebaseFirestore.collection(_collection).doc(id).update({
      'text': text,
      'updatedAt': now,
    });
    log('$MessageRepositoryImpl update message $id with $text');
  }

  @override
  Future<MessageEntity> getMessage({required String id}) async {
    final snapshot = await _firebaseFirestore.collection(_collection).doc(id).get();
    return _snapshotToEntity(snapshot);
  }

  @override
  Future<List<MessageEntity>> getMessages({required List<String> ids}) async {
    final entities = <MessageEntity>[];
    for (final id in ids) {
      final entity = await getMessage(id: id);
      entities.add(entity);
    }
    return entities;
  }

  @override
  Stream<List<MessageEntity>> watchMessages({required List<String> ids}) => _firebaseFirestore
      .collection(_collection)
      .where('id', whereIn: ids)
      .orderBy('createdAt')
      .snapshots()
      .map((querySnapshot) => querySnapshot.docs.map((docSnapshot) => _snapshotToEntity(docSnapshot)).toList());

  @override
  Future<void> deleteMessage({required String id}) async {
    final now = _dateTimeGenerator.nowUtc.toIso8601String();
    await _firebaseFirestore.collection(_collection).doc(id).update({
      'deletedAt': now,
    });
    log('$MessageRepositoryImpl delete message with $id');
  }
}
