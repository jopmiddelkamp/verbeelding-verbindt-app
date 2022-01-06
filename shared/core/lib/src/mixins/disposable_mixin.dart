import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

mixin DisposableMixin {
  final dispose$ = PublishSubject<void>();

  @mustCallSuper
  void dispose() {
    dispose$
      ..add(null)
      ..close();
  }
}
