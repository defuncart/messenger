import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/common/repositories/id/id_generator.dart';

void main() {
  group('$IdGeneratorImpl', () {
    test('generate', () {
      final idGenerator = IdGeneratorImpl();
      final uuid1 = idGenerator.generate();
      final uuid2 = idGenerator.generate();

      expect(uuid1, isNot(uuid2));
    });
  });
}
