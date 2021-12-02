import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/common/utils/phone_number_utils.dart';

void main() {
  group('$PhoneNumberUtils', () {
    group('combine', () {
      const countryCode = '+49';
      late String phoneNumber;

      group('when phone number begins with 0', () {
        setUp(() => phoneNumber = '015289763484');

        test('expect that 0 is dropped', () {
          expect(
            PhoneNumberUtils.combine(
              countryCode: countryCode,
              phoneNumber: phoneNumber,
            ),
            '+4915289763484',
          );
        });
      });

      group('when phone number does not begins with 0', () {
        setUp(() => phoneNumber = '15289763484');

        test('expect combined', () {
          expect(
            PhoneNumberUtils.combine(
              countryCode: countryCode,
              phoneNumber: phoneNumber,
            ),
            '+4915289763484',
          );
        });
      });
    });
  });
}
