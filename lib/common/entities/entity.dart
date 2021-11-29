import 'package:messenger/common/entities/failure.dart';
import 'package:messenger/common/entities/value_object.dart';
import 'package:meta/meta.dart';

/// An [Entity] which either contains a [value] or a [failure]
@immutable
abstract class Entity {
  /// Creates an [Entity] with [value]
  const Entity.value(ValueObject value)
      : hasValue = true,
        _value = value,
        _failure = null;

  /// Creates an [Entity] with [failure]
  const Entity.failure(Failure failure)
      : hasValue = false,
        _value = null,
        _failure = failure;

  /// Whether the entity has a value
  final bool hasValue;

  /// The entity's value
  ///
  /// Throws when the entity has no value
  ValueObject get value {
    if (!hasValue) {
      throw StateError('Entity $this has no value');
    }

    return _value!;
  }

  final ValueObject? _value;

  /// The entity's failure
  ///
  /// Throws when the entity has no failure
  Object get failure {
    if (hasValue) {
      throw StateError('Entity $this has no failure');
    }

    return _failure!;
  }

  final Object? _failure;

  @override
  bool operator ==(Object other) =>
      runtimeType == other.runtimeType &&
      other is Entity &&
      other.hasValue == hasValue &&
      (hasValue ? other.value == value : other.failure == failure);

  @override
  int get hashCode => hasValue ? value.hashCode : failure.hashCode;

  @override
  String toString() => 'Entity $runtimeType(hasValue: $hasValue, value: $_value, failure: $_failure)';
}
