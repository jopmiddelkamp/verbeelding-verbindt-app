import 'package:dartz/dartz.dart';

extension TaskExtensions<TEither extends Either<Object, TResult>, TResult>
    on Task<TEither> {
  Task<Either<TFailure, TResult>> mapLeftToFailure<TFailure>() {
    return map((either) {
      return either.leftMap((obj) {
        try {
          return obj as TFailure;
          // ignore: avoid_catches_without_on_clauses
        } catch (e) {
          throw obj;
        }
      });
    });
  }
}
