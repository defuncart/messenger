import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/service_locator.dart';

void main() {
  group('$ServiceLocator', () {
    tearDown(ServiceLocator.reset);

    test('When singelton registered, expect singelton found', () {
      ServiceLocator.testRegister(const _ClassOne());
      expect(
        () => ServiceLocator.get<_ClassOne>(),
        returnsNormally,
      );
    });

    test('When singelton not registered, expect singelton not found', () {
      ServiceLocator.testRegister(const _ClassOne());
      expect(
        () => ServiceLocator.get<_ClassTwo>(),
        throwsAssertionError,
      );
    });
  });
}

class _ClassOne {
  const _ClassOne();
}

class _ClassTwo {
  const _ClassTwo();
}
