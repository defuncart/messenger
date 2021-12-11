import 'package:messenger/domain/auth/auth_repository.dart';
import 'package:messenger/service_locator.dart';

class SignOutUseCase {
  SignOutUseCase({
    AuthRepository? authRepository,
  }) : _authRepository = authRepository ?? ServiceLocator.get<AuthRepository>();

  final AuthRepository _authRepository;

  Future<void> call() => _authRepository.signout();
}
