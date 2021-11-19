import 'package:uuid/uuid.dart';

abstract class IdGenerator {
  String generate();
}

class IdGeneratorImpl implements IdGenerator {
  @override
  String generate() {
    const uuid = Uuid();
    return uuid.v4();
  }
}
