import 'dart:math';

class VerifySMSCodeUseCase {
  const VerifySMSCodeUseCase();

  Future<bool> call(String smsCode) async {
    // TODO connect with AuthRepository
    await Future.delayed(const Duration(seconds: 2));

    return Random().nextBool();
  }
}
