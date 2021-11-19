import 'package:clock/clock.dart';

abstract class DateTimeGenerator {
  DateTime get nowUtc;
}

class DateTimeGeneratorImpl implements DateTimeGenerator {
  @override
  DateTime get nowUtc => clock.now().toUtc();
}
