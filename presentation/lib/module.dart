import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';

import 'global_bloc_observer.dart';

final serviceLocator = GetIt.instance;

class Module {
  static Future<void> initialize() async {
    Bloc.observer = GlobalBlocObserver();
  }
}
