import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../common/services/barrel.dart';
import '../constants.dart';
import '../intro/intro_page.dart';
import '../route_planner/pages/select_interests/select_interests_page.dart';
import '../routes.dart';
import '../theme.dart';
import 'bloc/barrel.dart';

final sl = GetIt.instance;

class App extends StatelessWidget {
  App._();

  static Widget blocProvider() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit(
            persistentStorageService: sl<PersistentStorageService>(),
          ),
        ),
      ],
      child: App._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '\'t Sal etaleert',
      theme: buildAppTheme(context),
      home: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          if (!state.loaded) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.introAccepted != true) {
            return IntroPage.blocProvider();
          }
          return SelectInterestsPage.blocProvider();
        },
      ),
      builder: BotToastInit(),
      navigatorObservers: [
        BotToastNavigatorObserver(),
      ],
      onGenerateRoute: onGenerateRoute,
      navigatorKey: Application.navigatorKey,
    );
  }
}
