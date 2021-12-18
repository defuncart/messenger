import 'dart:developer' show log;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messenger/common/repositories/date_time/date_time_generator.dart';
import 'package:messenger/common/repositories/id/id_generator.dart';
import 'package:messenger/domain/chat/chat_repository.dart';
import 'package:messenger/domain/chat/entity/chat_entity.dart';
import 'package:messenger/infrastructure/chat/chat.mapper.dart';
import 'package:messenger/infrastructure/chat/dto/chat_dto.dart';

class ChatRepositoryImpl implements ChatRepository {
  ChatRepositoryImpl({
    FirebaseFirestore? firebaseFirestore,
    required DateTimeGenerator dateTimeGenerator,
    required IdGenerator idGenerator,
  })  : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance,
        _dateTimeGenerator = dateTimeGenerator,
        _idGenerator = idGenerator;

  final FirebaseFirestore _firebaseFirestore;
  final DateTimeGenerator _dateTimeGenerator;
  final IdGenerator _idGenerator;

  static const _collection = 'chats';

  /// Saves a chat to db
  ///
  /// If the chat does not exist, it is created, otherwise existing chat overwritten
  Future<void> _saveChat(ChatDto chat) async {
    await _firebaseFirestore.collection(_collection).doc(chat.id).set(chat.toJson());
    log('$ChatRepositoryImpl saved chat ${chat.toString()}');
  }

  /// Maps [ChatDto] to [ChatEntity]
  ChatEntity _dtoToEntity(ChatDto dto) => ChatEntity.value(dto.toValueObject());

  /// Maps [DocumentSnapshot] to [ChatEntity]
  ChatEntity _snapshotToEntity(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    if (snapshot.exists) {
      try {
        final dto = ChatDto.fromJson(snapshot.data()!);
        return _dtoToEntity(dto);
      } catch (e) {
        return ChatEntity.failure(ChatCouldNotBeParsedFailure());
      }
    }
    return ChatEntity.failure(ChatNotFoundFailure());
  }

  @override
  Future<ChatEntity> createChat({
    required List<String> userIds,
    required String createdBy,
  }) async {
    final id = _idGenerator.generate();
    final now = _dateTimeGenerator.nowUtc;
    final message = ChatDto(
      id: id,
      userIds: userIds,
      createdBy: createdBy,
      createdAt: now,
    );

    await _saveChat(message);

    return _dtoToEntity(message);
  }

  @override
  Future<ChatEntity> getChat({required String id}) async {
    final snapshot = await _firebaseFirestore.collection(_collection).doc(id).get();
    return _snapshotToEntity(snapshot);
  }

  @override
  Stream<ChatEntity> watchChat({required String id}) =>
      _firebaseFirestore.collection(_collection).doc(id).snapshots().map(_snapshotToEntity);

  @override
  Future<void> deleteChat({required String id}) async {
    final now = _dateTimeGenerator.nowUtc.toIso8601String();
    await _firebaseFirestore.collection(_collection).doc(id).update({
      'deletedAt': now,
    });
    log('$ChatRepositoryImpl delete chat with $id');
  }
}
