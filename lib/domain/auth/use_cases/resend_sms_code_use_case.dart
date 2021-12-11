import 'package:messenger/domain/auth/auth_repository.dart';
import 'package:messenger/domain/auth/entity/verification_code_entity.dart';
import 'package:messenger/service_locator.dart';

class ResendSMSCodeUseCase {
  ResendSMSCodeUseCase({
    AuthRepository? authRepository,
  }) : _authRepository = authRepository ?? ServiceLocator.get<AuthRepository>();

  final AuthRepository _authRepository;

  Future<VerificationCodeEntity> call({required String phoneNumber, required int resendToken}) =>
      _authRepository.resendVerificationCode(phoneNumber: phoneNumber, resendToken: resendToken);
}
