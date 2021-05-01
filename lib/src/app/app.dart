import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../features/intro/presentation/pages/intro/intro_page.dart';
import '../features/route_guide/presentation/pages/select_interests/select_interests_page.dart';
import '../routes.dart';
import '../shared/domain/services/barrel.dart';
import '../theme.dart';
import 'bloc/barrel.dart';

final sl = GetIt.instance;

class App extends StatelessWidget {
  App._();

  static Widget blocProvider({
    required GlobalKey<NavigatorState> navigatorKey,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit(
            persistentStorageService: sl<PersistentStorageService>(),
            navigatorKey: navigatorKey,
          ),
        ),
      ],
      child: App._(),
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return MaterialApp(
          title: '\'t Sal etaleert',
          theme: buildAppTheme(context),
          home: _buildHome(state),
          builder: BotToastInit(),
          navigatorObservers: [
            BotToastNavigatorObserver(),
          ],
          onGenerateRoute: onGenerateRoute,
          navigatorKey: state.navigatorKey,
        );
      },
    );
  }

  Widget _buildHome(
    AppState state,
  ) {
    if (!state.loaded) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (state.introAccepted != true) {
      return IntroPage.blocProvider();
    }
    return SelectInterestsPage.blocProvider();
  }
}
