import 'package:verbeelding_verbindt_core/failures/failure.dart';

abstract class PersistentStorageFailureBase implements Failure {
  const PersistentStorageFailureBase();
}

class TypeMismatchPersistentStorageFailure
    extends PersistentStorageFailureBase {
  const TypeMismatchPersistentStorageFailure();
}
