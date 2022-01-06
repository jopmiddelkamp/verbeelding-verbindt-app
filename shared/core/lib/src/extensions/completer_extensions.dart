import 'dart:async';

extension CompleterX<TResult> on Completer<TResult> {
  void completeIfNotCompleted([
    FutureOr<TResult>? value,
  ]) {
    if (!isCompleted) {
      complete(
        value,
      );
    }
  }
}
