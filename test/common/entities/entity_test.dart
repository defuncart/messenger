import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/common/entities/entity.dart';
import 'package:messenger/common/entities/failure.dart';
import 'package:messenger/common/entities/value_object.dart';
import 'package:meta/meta.dart';

void main() {
  late _MyEntity entity;

  group('when entity has data', () {
    final valueObject = _MyValueObject(myString: '42');

    setUp(() {
      entity = _MyEntity.value(valueObject);
    });

    test('then expect hasValue isTrue', () {
      expect(entity.hasValue, isTrue);
    });

    test('then expect value', () {
      expect(entity.value, valueObject);
    });

    test('then expect failure throws', () {
      expect(() => entity.failure, throwsStateError);
    });

    test('then ensure toString is overridden', () {
      expect(entity.toString(), isNot("Instance of '_MyEntity'"));
    });
  });

  group('when entity has failure', () {
    final failure = _MyFailure();

    setUp(() {
      entity = _MyEntity.failure(failure);
    });

    test('then expect hasValue isFalse', () {
      expect(entity.hasValue, isFalse);
    });

    test('then expect value throws', () {
      expect(() => entity.value, throwsStateError);
    });

    test('then expect failure', () {
      expect(entity.failure, failure);
    });

    test('then ensure toString is overridden', () {
      expect(entity.toString(), isNot("Instance of '_MyEntity'"));
    });
  });

  late _MyEntity anotherEntity;

  group('when two entites are identical', () {
    setUp(() {
      entity = _MyEntity.value(_MyValueObject(myString: '42'));
      anotherEntity = _MyEntity.value(_MyValueObject(myString: '42'));
    });

    test('then expect equality', () {
      expect(entity, anotherEntity);
    });
  });

  group('when two entites are not identical', () {
    setUp(() {
      entity = _MyEntity.value(_MyValueObject(myString: '42'));
      anotherEntity = _MyEntity.value(_MyValueObject(myString: 'bla'));
    });

    test('then do not expect equality', () {
      expect(entity, isNot(anotherEntity));
    });
  });
}

class _MyEntity extends Entity {
  const _MyEntity.value(_MyValueObject value) : super.value(value);

  const _MyEntity.failure(_MyFailure failure) : super.failure(failure);
}

@immutable
class _MyValueObject extends ValueObject {
  _MyValueObject({required this.myString});

  final String myString;

  @override
  bool operator ==(Object other) =>
      runtimeType == other.runtimeType && other is _MyValueObject && other.myString == myString;

  @override
  int get hashCode => myString.hashCode;
}

@immutable
class _MyFailure extends Failure {}
