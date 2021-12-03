import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

abstract class PersistentStorageFailureBase implements Failure {
  const PersistentStorageFailureBase();
}

class TypeMismatchPersistentStorageFailure
    extends PersistentStorageFailureBase {
  const TypeMismatchPersistentStorageFailure();
}
