import 'dart:math';

class ResendSMSCodeUseCase {
  const ResendSMSCodeUseCase();

  Future<bool> call() async {
    // TODO connect with AuthRepository
    await Future.delayed(const Duration(milliseconds: 500));

    return Random().nextBool();
  }
}
