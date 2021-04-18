import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:verbeelding_verbindt/src/app.dart';

import 'global_bloc_observer.dart';

void main() {
  Bloc.observer = GlobalBlocObserver();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(
    () => runApp(App.blocProvider()),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
