import 'package:messenger/domain/chat/chat_repository.dart';
import 'package:messenger/domain/chat/entity/chat_entity.dart';
import 'package:messenger/service_locator.dart';

class WatchChatUseCase {
  WatchChatUseCase({
    ChatRepository? chatRepository,
  }) : _chatRepository = chatRepository ?? ServiceLocator.get<ChatRepository>();

  final ChatRepository _chatRepository;

  Stream<ChatEntity> call(String id) => _chatRepository.watchChat(id: id);
}
