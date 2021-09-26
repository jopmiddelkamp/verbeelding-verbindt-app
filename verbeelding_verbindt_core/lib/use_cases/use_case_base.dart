abstract class UseCase<TResult, TArgument> {
  Future<TResult> call(TArgument argument);
}
