import 'package:flutter/material.dart';
import 'package:messenger/common/utils/phone_number_utils.dart';
import 'package:messenger/domain/auth/use_cases/resend_sms_code_use_case.dart';
import 'package:messenger/domain/auth/use_cases/verify_phone_number_use_case.dart';
import 'package:messenger/domain/auth/use_cases/verify_sms_code_use_case.dart';
import 'package:messenger/domain/common/use_cases/create_user_on_first_login_use_case.dart';

enum AuthScreenState {
  phoneNumber,
  smsCode,
}

class AuthScreenViewModel extends ChangeNotifier {
  AuthScreenViewModel({
    VerifyPhoneNumberUseCase? verifyPhoneNumberUseCase,
    VerifySMSCodeUseCase? verifySMSCodeUseCase,
    ResendSMSCodeUseCase? resendSMSCodeUseCase,
    CreateUserOnFirstLoginUseCase? createUserOnFirstLoginUseCase,
  })  : _verifyPhoneNumberUseCase = verifyPhoneNumberUseCase ?? VerifyPhoneNumberUseCase(),
        _verifySMSCodeUseCase = verifySMSCodeUseCase ?? VerifySMSCodeUseCase(),
        _resendSMSCodeUseCase = resendSMSCodeUseCase ?? ResendSMSCodeUseCase(),
        _createUserOnFirstLoginUseCase = createUserOnFirstLoginUseCase ?? CreateUserOnFirstLoginUseCase();

  final VerifyPhoneNumberUseCase _verifyPhoneNumberUseCase;
  final VerifySMSCodeUseCase _verifySMSCodeUseCase;
  final ResendSMSCodeUseCase _resendSMSCodeUseCase;
  final CreateUserOnFirstLoginUseCase _createUserOnFirstLoginUseCase;

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

  String _verificationId = '';
  int _resendToken = 0;

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
    if (result.hasValue) {
      _verificationId = result.value.id;
      _resendToken = result.value.resendToken;
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

    final result = await _verifySMSCodeUseCase(
      verificationId: _verificationId,
      smsCode: smsCode,
    );
    if (result.hasValue) {
      // create a user in db only if it is first login
      _createUserOnFirstLoginUseCase(userId: result.value.userId, phoneNumber: phoneNumberWithCountryCode);
    }

    _isLoading = false;
    notifyListeners();

    return result.hasValue;
  }

  Future<bool> onResendCode() async {
    final result = await _resendSMSCodeUseCase(phoneNumber: phoneNumberWithCountryCode, resendToken: _resendToken);
    return result.hasValue;
  }

  void onChangeNumber() {
    _state = AuthScreenState.phoneNumber;
    _shouldPrefilPhoneNumber = true;
    notifyListeners();
  }
}
