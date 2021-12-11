import 'package:messenger/domain/auth/auth_repository.dart';
import 'package:messenger/domain/auth/entity/verification_code_entity.dart';
import 'package:messenger/service_locator.dart';

class VerifyPhoneNumberUseCase {
  VerifyPhoneNumberUseCase({
    AuthRepository? authRepository,
  }) : _authRepository = authRepository ?? ServiceLocator.get<AuthRepository>();

  final AuthRepository _authRepository;

  Future<VerificationCodeEntity> call(String phoneNumber) =>
      _authRepository.requestVerificationCode(phoneNumber: phoneNumber);
}
