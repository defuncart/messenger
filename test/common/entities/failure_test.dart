import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/common/entities/failure.dart';
import 'package:meta/meta.dart';

void main() {
  late Failure failure1;
  late Failure failure2;

  group('when two failures are identical', () {
    setUp(() {
      failure1 = _AFailure();
      failure2 = _AFailure();
    });

    test('then expect equality', () {
      expect(failure1, failure2);
    });
  });

  group('when two failures are not identical', () {
    setUp(() {
      failure1 = _AFailure();
      failure2 = _AnotherFailure();
    });

    test('then do not expect equality', () {
      expect(failure1, isNot(failure2));
    });
  });
}

@immutable
class _AFailure extends Failure {}

@immutable
class _AnotherFailure extends Failure {}
