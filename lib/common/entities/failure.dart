abstract class Failure {
  @override
  bool operator ==(Object other) => runtimeType == other.runtimeType && other is Failure;

  @override
  int get hashCode => 1;
}
