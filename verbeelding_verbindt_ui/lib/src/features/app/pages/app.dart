import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../verbeelding_verbindt_ui.dart';

class App extends StatelessWidget {
  const App._({
    required this.navigatorKey,
    required this.initialLocale,
  });

  static Widget bloc({
    required LocaleEntity initialLocale,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AppCubit(
            getUsersRouteUseCase: GetIt.instance(),
            getIsIntroAcceptedUseCase: GetIt.instance(),
            getAuthenticatedUserUseCase: GetIt.instance(),
          )..init(),
        ),
        BlocProvider(
          create: (_) => LocalizationCubit(
            getActiveLocaleUseCase: GetIt.instance(),
            setActiveLocaleUseCase: GetIt.instance(),
          )..init(),
        ),
        BlocProvider(
          create: (_) => PermissionCubit(
            getPermissionStatusUseCase: GetIt.instance(),
            requestPermissionUseCase: GetIt.instance(),
          )..init(),
        ),
      ],
      child: App._(
        navigatorKey: GlobalKey<NavigatorState>(),
        initialLocale: initialLocale,
      ),
    );
  }

  final GlobalKey<NavigatorState> navigatorKey;
  final LocaleEntity initialLocale;

  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp(
      title: 'Verbeelding Verbindt',
      theme: buildAppTheme(context),
      // Wrapped around home so there is a navigator present
      home: BlocListener<AppCubit, AppState>(
        listener: _initialNavigationListener,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      builder: (context, child) {
        return FlavorBanner(
          child: BotToastInit()(context, child),
          navigatorKey: navigatorKey,
        );
      },
      navigatorObservers: [
        BotToastNavigatorObserver(),
      ],
      onGenerateRoute: onGenerateRoute,
      navigatorKey: navigatorKey,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      localeResolutionCallback: (_, __) {
        return Locale(
          EnumUtils.getStringValue(initialLocale.isoLanguage.languageCode),
        );
      },
    );
  }

  Future<void> _initialNavigationListener(
    BuildContext context,
    AppState state,
  ) async {
    if (state is! AppLoaded) {
      return;
    }
    if (state.hasNotAcceptedIntro) {
      await context.navigator.pushReplacementNamed(
        IntroPage.routeName,
      );
      return;
    }
    if (state.hasNoActiveRoute) {
      context.navigator.pushReplacementNamed(
        SelectInterestsPage.routeName,
      );
      return;
    }
    context.navigator.pushReplacement(
      InstantMaterialPageRoute(
        builder: (context) {
          return SelectInterestsPage.bloc();
        },
      ),
    );
    if (state.hasCompletedRoute) {
      await context.navigator.pushNamed(
        CompletedPage.routeName,
        arguments: state.route!.id!,
      );
      return;
    }
    await context.navigator.pushNamed(
      GuidePage.routeName,
      arguments: const OpenRouteGuidePageArguments(),
    );
  }
}
