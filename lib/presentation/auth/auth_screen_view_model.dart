import 'package:flutter/material.dart';
import 'package:messenger/common/utils/phone_number_utils.dart';
import 'package:messenger/domain/auth/use_cases/verify_phone_number_use_case.dart';

enum AuthScreenState {
  phoneNumber,
  smsCode,
}

class AuthScreenViewModel extends ChangeNotifier {
  AuthScreenViewModel({
    VerifyPhoneNumberUseCase? verifyPhoneNumberUseCase,
  }) : _verifyPhoneNumberUseCase = verifyPhoneNumberUseCase ?? const VerifyPhoneNumberUseCase();

  final VerifyPhoneNumberUseCase _verifyPhoneNumberUseCase;

  var _state = AuthScreenState.phoneNumber;
  AuthScreenState get state => _state;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _phoneNumberIsInvalid = false;
  bool get phoneNumberIsInvalid => _phoneNumberIsInvalid;

  Future<void> onPhoneNumberSubmitted(String countryCode, String phoneNumber) async {
    print('onPhoneNumberSubmitted');

    _phoneNumberIsInvalid = false;
    _isLoading = true;
    notifyListeners();

    final fullPhoneNumber = PhoneNumberUtils.combine(countryCode: countryCode, phoneNumber: phoneNumber);
    final result = await _verifyPhoneNumberUseCase(fullPhoneNumber);
    if (result) {
      _state = AuthScreenState.smsCode;
    } else {
      _phoneNumberIsInvalid = true;
    }

    _isLoading = false;
    notifyListeners();
  }
}
