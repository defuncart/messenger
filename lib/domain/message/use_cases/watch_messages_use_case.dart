import 'package:messenger/domain/message/entity/message_entity.dart';
import 'package:messenger/domain/message/message_repository.dart';
import 'package:messenger/service_locator.dart';

class WatchMessagesUseCase {
  WatchMessagesUseCase({
    MessageRepository? messageRepository,
  }) : _messageRepository = messageRepository ?? ServiceLocator.get<MessageRepository>();

  final MessageRepository _messageRepository;

  Stream<List<MessageEntity>> call(List<String> ids) => _messageRepository.watchMessages(ids: ids);
}
