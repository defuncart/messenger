import 'package:clock/clock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/common/repositories/date_time/date_time_generator.dart';

void main() {
  group('$DateTimeGeneratorImpl', () {
    test('nowUtc', () {
      final now = DateTime(1);
      final mockClock = Clock(() => now);
      withClock(mockClock, () {
        final nowUtc = DateTimeGeneratorImpl().nowUtc;

        expect(nowUtc.isUtc, isTrue);
        expect(nowUtc, now.toUtc());
      });
    });
  });
}
