import 'package:messenger/domain/auth/auth_repository.dart';
import 'package:messenger/service_locator.dart';

class GetAuthUserIdUseCase {
  GetAuthUserIdUseCase({
    AuthRepository? authRepository,
  }) : _authRepository = authRepository ?? ServiceLocator.get<AuthRepository>();

  final AuthRepository _authRepository;

  String? call() => _authRepository.userId;
}
