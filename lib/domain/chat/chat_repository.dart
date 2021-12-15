import 'package:messenger/domain/chat/entity/chat_entity.dart';

abstract class ChatRepository {
  /// Creates a [ChatEntity] with a List of [userIds]
  Future<ChatEntity> createChat({
    required List<String> userIds,
    required String createdBy,
  });

  /// Returns a [ChatEntity] by [id]
  Future<ChatEntity> getChat({required String id});

  /// Deletes a [ChatEntity] by [id]
  Future<void> deleteChat({required String id});
}
