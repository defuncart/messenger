abstract class PhoneNumberUtils {
  static String combine({
    required String countryCode,
    required String phoneNumber,
  }) {
    assert(phoneNumber.isNotEmpty);

    // TODO hardcoded for DE
    return countryCode + (phoneNumber[0] == '0' ? phoneNumber.substring(1) : phoneNumber);
  }
}
