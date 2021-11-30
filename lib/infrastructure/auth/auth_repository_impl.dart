import 'dart:async';
import 'dart:io' show Platform;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:messenger/domain/auth/auth_repository.dart';
import 'package:messenger/domain/auth/entity/auth_entity.dart';
import 'package:messenger/domain/auth/entity/verification_code_entity.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;

  @override
  Future<VerificationCodeEntity> requestVerificationCode({required String phoneNumber}) async {
    if (Platform.isIOS || Platform.isAndroid) {
      return _requestVerificationCodeMobile(phoneNumber: phoneNumber);
    } else {
      throw UnsupportedError('Platform is not supported');
    }
  }

  Future<VerificationCodeEntity> _requestVerificationCodeMobile({required String phoneNumber}) async {
    final completer = Completer<VerificationCodeEntity>();

    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (_) {},
      verificationFailed: (exception) {
        completer.complete(
          VerificationCodeEntity.failure(VerificationCodeFailure()),
        );

        // [SmsRetrieverHelper] SMS verification code request failed: unknown status code: 17010 null
        // We have blocked all requests from this device due to unusual activity. Try again later.
      },
      codeSent: (verificationId, resendToken) {
        completer.complete(
          VerificationCodeEntity.value(VerificationCodeValueObject(id: verificationId)),
        );
      },
      codeAutoRetrievalTimeout: (_) {},
    );

    return completer.future;
  }

  @override
  Future<AuthEntity> signin({required String verificationId, required String smsCode}) async {
    try {
      final result = await _firebaseAuth
          .signInWithCredential(PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode));
      return AuthEntity.value(AuthValueObject(authenticatedSuccessfully: result.user != null));
    } catch (e) {
      return AuthEntity.failure(AuthFailure());
    }
  }
}
