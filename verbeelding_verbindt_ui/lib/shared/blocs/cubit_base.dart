import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/subjects.dart';

export 'package:rxdart/rxdart.dart';

class CubitBase<TState> extends Cubit<TState> {
  CubitBase(TState initialState) : super(initialState);

  final _close$ = BehaviorSubject<void>();

  Stream<void> get close$ => _close$.stream.asBroadcastStream();

  @override
  @mustCallSuper
  Future<void> close() {
    _close$.add(null);
    return super.close();
  }
}
