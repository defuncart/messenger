import 'package:flutter/material.dart';
import 'package:messenger/common/utils/phone_number_utils.dart';
import 'package:messenger/domain/auth/use_cases/resend_sms_code_use_case.dart';
import 'package:messenger/domain/auth/use_cases/verify_phone_number_use_case.dart';
import 'package:messenger/domain/auth/use_cases/verify_sms_code_use_case.dart';

enum AuthScreenState {
  phoneNumber,
  smsCode,
}

class AuthScreenViewModel extends ChangeNotifier {
  AuthScreenViewModel({
    VerifyPhoneNumberUseCase? verifyPhoneNumberUseCase,
    VerifySMSCodeUseCase? verifySMSCodeUseCase,
    ResendSMSCodeUseCase? resendSMSCodeUseCase,
  })  : _verifyPhoneNumberUseCase = verifyPhoneNumberUseCase ?? const VerifyPhoneNumberUseCase(),
        _verifySMSCodeUseCase = verifySMSCodeUseCase ?? const VerifySMSCodeUseCase(),
        _resendSMSCodeUseCase = resendSMSCodeUseCase ?? const ResendSMSCodeUseCase();

  final VerifyPhoneNumberUseCase _verifyPhoneNumberUseCase;
  final VerifySMSCodeUseCase _verifySMSCodeUseCase;
  final ResendSMSCodeUseCase _resendSMSCodeUseCase;

  var _state = AuthScreenState.phoneNumber;
  AuthScreenState get state => _state;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _shouldPrefilPhoneNumber = false;
  String? get phoneNumberPreFill => _shouldPrefilPhoneNumber ? _phoneNumber : null;

  bool _phoneNumberIsInvalid = false;
  bool get phoneNumberIsInvalid => _phoneNumberIsInvalid;

  String _countryCode = '';
  String _phoneNumber = '';

  String get phoneNumberWithCountryCode =>
      PhoneNumberUtils.combine(countryCode: _countryCode, phoneNumber: _phoneNumber);

  Future<void> onPhoneNumberSubmitted(String countryCode, String phoneNumber) async {
    _countryCode = countryCode;
    _phoneNumber = phoneNumber;

    _shouldPrefilPhoneNumber = false;
    _phoneNumberIsInvalid = false;
    _isLoading = true;
    notifyListeners();

    final result = await _verifyPhoneNumberUseCase(phoneNumberWithCountryCode);
    if (result) {
      _state = AuthScreenState.smsCode;
    } else {
      _phoneNumberIsInvalid = true;
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<bool> onCodeSubmitted(String smsCode) async {
    _isLoading = true;
    notifyListeners();

    final success = await _verifySMSCodeUseCase(smsCode);

    _isLoading = false;
    notifyListeners();

    return success;
  }

  Future<bool> onResendCode() => _resendSMSCodeUseCase();

  void onChangeNumber() {
    _state = AuthScreenState.phoneNumber;
    _shouldPrefilPhoneNumber = true;
    notifyListeners();
  }
}
