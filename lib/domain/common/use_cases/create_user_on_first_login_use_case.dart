import 'package:messenger/domain/user/entity/user_entity.dart';
import 'package:messenger/domain/user/user_respository.dart';
import 'package:messenger/service_locator.dart';

class CreateUserOnFirstLoginUseCase {
  CreateUserOnFirstLoginUseCase({
    UserRepository? userRepository,
  }) : _userRepository = userRepository ?? ServiceLocator.get<UserRepository>();

  final UserRepository _userRepository;

  Future<void> call({
    required String userId,
    required String phoneNumber,
    String displayName = 'displayName',
  }) async {
    final user = await _userRepository.getUser(id: userId);
    if (!user.hasValue && user.failure is UserNotFoundFailure) {
      await _userRepository.createUser(id: userId, phoneNumber: phoneNumber, displayName: displayName);
    }
  }
}
