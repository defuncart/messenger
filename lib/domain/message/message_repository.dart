import 'package:messenger/domain/message/entity/message_entity.dart';

abstract class MessageRepository {
  /// Creates a [MessageEntity] with [text]
  Future<MessageEntity> createMessage({required String text});

  /// Updates a [MessageEntity] by [id]
  Future<void> updateMessage({required String id, required String text});

  /// Returns a [MessageEntity] by [id]
  Future<MessageEntity> getMessage({required String id});

  /// Returns a List of [MessageEntity] by [ids]
  Future<List<MessageEntity>> getMessages({required List<String> ids});

  /// Deletes a [MessageEntity] by [id]
  Future<void> deleteMessage({required String id});
}
