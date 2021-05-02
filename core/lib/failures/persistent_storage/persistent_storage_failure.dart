import '../failure.dart';

abstract class PersistentStorageFailure implements Failure {
  const PersistentStorageFailure();
}

class TypeMismatchPersistentStorageFailure extends PersistentStorageFailure {
  const TypeMismatchPersistentStorageFailure({
    required this.storageType,
    required this.expectedType,
  });

  final Type storageType;
  final Type expectedType;
}
