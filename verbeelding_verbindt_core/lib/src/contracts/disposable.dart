import 'package:flutter/widgets.dart';

abstract class Disposable {
  @mustCallSuper
  Future<void> dispose();
}
