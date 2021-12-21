import 'dart:async';

import 'package:flutter/foundation.dart';

@optionalTypeArgs
mixin ReadyMixin<TResult> {
  @protected
  Completer<TResult> readyCompleter = Completer<TResult>();

  bool get isReady => readyCompleter.isCompleted;
  bool get isNotReady => !isReady;

  Future<TResult> get onReady => readyCompleter.future;
}
