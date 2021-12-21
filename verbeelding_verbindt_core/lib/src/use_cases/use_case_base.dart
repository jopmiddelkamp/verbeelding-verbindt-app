abstract class UseCase<TResult, TParam> {
  TResult call(TParam params);
}
