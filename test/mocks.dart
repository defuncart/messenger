import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/common/repositories/date_time/date_time_generator.dart';
import 'package:messenger/common/repositories/id/id_generator.dart';
import 'package:messenger/domain/auth/auth_repository.dart';
import 'package:messenger/domain/auth/use_cases/resend_sms_code_use_case.dart';
import 'package:messenger/domain/auth/use_cases/sign_out_use_case.dart';
import 'package:messenger/domain/auth/use_cases/verify_phone_number_use_case.dart';
import 'package:messenger/domain/auth/use_cases/verify_sms_code_use_case.dart';
import 'package:messenger/presentation/auth/auth_screen_view_model.dart';
import 'package:mocktail/mocktail.dart';

// repositories
class MockAuthRepository extends Mock implements AuthRepository {}

class MockDateTimeGenerator extends Mock implements DateTimeGenerator {}

class MockIdGenerator extends Mock implements IdGenerator {}

// view models
class MockAuthScreenViewModel extends Mock implements AuthScreenViewModel {}

// use cases
class MockVerifyPhoneNumberUseCase extends Mock implements VerifyPhoneNumberUseCase {}

class MockResendSMSCodeUseCase extends Mock implements ResendSMSCodeUseCase {}

class MockVerifySMSCodeUseCase extends Mock implements VerifySMSCodeUseCase {}

class MockSignOutUseCase extends Mock implements SignOutUseCase {}

// functions
class MockVoidCallback<T1, T2> extends Mock {
  void call([T1 arg1, T2 arg2]);
}

class MethodChannelMocks {
  // taken from https://github.com/FirebaseExtended/flutterfire/blob/master/packages/firebase_auth/firebase_auth/test/mock.dart
  static void setupFirebase([void Function(MethodCall call)? customHandlers]) {
    TestWidgetsFlutterBinding.ensureInitialized();

    MethodChannelFirebase.channel.setMockMethodCallHandler((call) async {
      if (call.method == 'Firebase#initializeCore') {
        return [
          {
            'name': defaultFirebaseAppName,
            'options': {
              'apiKey': '123',
              'appId': '123',
              'messagingSenderId': '123',
              'projectId': '123',
            },
            'pluginConstants': {},
          }
        ];
      }

      if (call.method == 'Firebase#initializeApp') {
        return {
          'name': call.arguments['appName'],
          'options': call.arguments['options'],
          'pluginConstants': {},
        };
      }

      if (customHandlers != null) {
        customHandlers(call);
      }

      return null;
    });
  }
}
