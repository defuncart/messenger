import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/domain/auth/failures/user_is_not_authenticated_failure.dart';

void main() {
  group('$UserIsNotAuthenticatedFailure', () {
    test('expect equality', () {
      const failure1 = UserIsNotAuthenticatedFailure();
      const failure2 = UserIsNotAuthenticatedFailure();

      expect(failure1, failure2);
    });
  });
}
