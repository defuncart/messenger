import 'package:messenger/domain/auth/use_cases/get_auth_user_id_use_case.dart';
import 'package:messenger/domain/message/entity/message_entity.dart';

class MessageViewModel {
  MessageViewModel({
    GetAuthUserIdUseCase? getAuthUserIdUseCase,
  }) : _getAuthUserIdUseCase = getAuthUserIdUseCase ?? GetAuthUserIdUseCase();

  final GetAuthUserIdUseCase _getAuthUserIdUseCase;

  bool _hasError = false;
  MessageValueObject? _messageValueObject;
  bool _createdByUser = false;

  void initialize(MessageEntity entity) {
    if (entity.hasValue) {
      _messageValueObject = entity.value;
      _createdByUser = entity.value.createdBy == _getAuthUserIdUseCase();
    } else {
      _hasError = true;
    }
  }

  bool get hasError => _hasError;
  String get text => _messageValueObject!.text;
  DateTime get createdAt => _messageValueObject!.createdAt;
  bool get createdByUser => _createdByUser;
  bool get canBeEdited => _createdByUser;
  bool get canBeDeleted => _createdByUser;
}
