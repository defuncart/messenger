import 'package:messenger/domain/auth/entity/auth_entity.dart';
import 'package:messenger/domain/auth/entity/verification_code_entity.dart';

abstract class AuthRepository {
  Future<VerificationCodeEntity> requestVerificationCode({required String phoneNumber});
  Future<AuthEntity> signin({required String verificationId, required String smsCode});
}
