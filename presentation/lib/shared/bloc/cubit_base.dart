import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

import 'state_base.dart';

abstract class CubitBase<TState extends StateBase> extends Cubit<TState> {
  CubitBase(
    TState initialState,
  ) : super(
          initialState,
        );

  final PublishSubject<Null> dispose$ = PublishSubject<Null>();

  @override
  @mustCallSuper
  Future<void> close() async {
    dispose$.add(null);
    await super.close();
  }
}
