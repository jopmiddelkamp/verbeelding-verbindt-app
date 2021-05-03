import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:verbeelding_verbindt_core/failures/failure.dart';

abstract class StateBase {
  StateBase({
    required this.failure,
  });

  final Failure? failure;
  final PublishSubject<Null> dispose$ = PublishSubject<Null>();

  bool get hasFailure => failure == null;

  @override
  String toString() => '''$runtimeType { 
                            failure: $failure, 
                          }''';

  @mustCallSuper
  Future<void> dispose() async {
    dispose$.add(null);
  }
}
