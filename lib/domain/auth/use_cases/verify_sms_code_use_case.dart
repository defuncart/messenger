import 'package:messenger/domain/auth/auth_repository.dart';
import 'package:messenger/domain/auth/entity/auth_entity.dart';
import 'package:messenger/service_locator.dart';

class VerifySMSCodeUseCase {
  VerifySMSCodeUseCase({
    AuthRepository? authRepository,
  }) : _authRepository = authRepository ?? ServiceLocator.get<AuthRepository>();

  final AuthRepository _authRepository;

  Future<AuthEntity> call({required String verificationId, required String smsCode}) =>
      _authRepository.signin(verificationId: verificationId, smsCode: smsCode);
}
