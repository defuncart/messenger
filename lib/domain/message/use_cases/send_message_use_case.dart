import 'package:messenger/domain/auth/auth_repository.dart';
import 'package:messenger/domain/auth/failures/user_is_not_authenticated_failure.dart';
import 'package:messenger/domain/message/entity/message_entity.dart';
import 'package:messenger/domain/message/message_repository.dart';
import 'package:messenger/service_locator.dart';

class SendMessageUseCase {
  SendMessageUseCase({
    MessageRepository? messageRepository,
    AuthRepository? authRepository,
  })  : _messageRepository = messageRepository ?? ServiceLocator.get<MessageRepository>(),
        _authRepository = authRepository ?? ServiceLocator.get<AuthRepository>();

  final MessageRepository _messageRepository;
  final AuthRepository _authRepository;

  Future<MessageEntity> call(String text) {
    final createdBy = _authRepository.userId;
    if (createdBy != null) {
      return _messageRepository.createMessage(
        text: text,
        createdBy: createdBy,
      );
    } else {
      return Future.value(const MessageEntity.failure(UserIsNotAuthenticatedFailure()));
    }
  }
}
