import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:verbeelding_verbindt_core/entities/common/environment_enum.dart';

import 'global_bloc_observer.dart';

class Module {
  static Future<void> initialize(
    Environment environment,
  ) async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    if (environment == Environment.prod) {
      debugPrint = (message, {wrapWidth}) {};
    }
    Bloc.observer = GlobalBlocObserver();
  }
}
