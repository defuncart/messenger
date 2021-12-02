import 'dart:math';

class VerifyPhoneNumberUseCase {
  const VerifyPhoneNumberUseCase();

  Future<bool> call(String phoneNumber) async {
    // TODO connect with AuthRepository
    await Future.delayed(const Duration(seconds: 2));

    return Random().nextBool();
  }
}
