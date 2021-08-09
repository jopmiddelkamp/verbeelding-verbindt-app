abstract class UseCaseBase {}

abstract class UseCase<TResult> implements UseCaseBase {
  Future<TResult> handle();
}

abstract class UseCaseWithArgument<TResult, TArgument> implements UseCaseBase {
  Future<TResult> handle(TArgument argument);
}

abstract class UseCaseWithOptionalArgument<TResult, TArgument>
    implements UseCaseBase {
  Future<TResult> handle([TArgument argument]);
}
