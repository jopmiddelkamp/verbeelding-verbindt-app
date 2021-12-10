import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../../verbeelding_verbindt_ui.dart';

class App extends StatefulWidget {
  const App._();

  static Widget bloc({
    required AppCubit appCubit,
    required LocalizationCubit localizationCubit,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: appCubit),
        BlocProvider.value(value: localizationCubit),
      ],
      child: const App._(),
    );
  }

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late GlobalKey<NavigatorState> navigatorKey;
  late bool needNavigation;

  @override
  void initState() {
    navigatorKey = GlobalKey<NavigatorState>();
    needNavigation = true;
    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final theme = CustomThemeData(
      colorScheme: kDefaultThemeColorSchemeLight,
    );
    return BlocListener<AppCubit, AppState>(
      listener: (context, appState) async {
        if (appState is AppFailed) {
          // TODO: Show correct message
          await showErrorDialog(
            context,
            title: context.l10n.dialogErrorUnknownErrorTitle,
            message: context.l10n.dialogErrorUnknownErrorMessage,
          );
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          return;
        }
      },
      child: BlocBuilder<LocalizationCubit, LocalizationState>(
        builder: (context, localizationState) {
          return CustomTheme(
            data: theme,
            child: MaterialApp(
              title: 'Verbeelding Verbindt',
              theme: theme.materialTheme,
              // Wrapped around home so there is a navigator present
              home: Builder(
                builder: (context) {
                  // TODO: ugly work around improve by implementing Navigator 2.0
                  _initialNavigation(context);
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              builder: (context, child) {
                return FlavorBanner(
                  child: child!,
                  navigatorKey: navigatorKey,
                );
              },
              onGenerateRoute: onGenerateRoute,
              navigatorKey: navigatorKey,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                AppLocalizations.delegate,
              ],
              supportedLocales: AppLocalizations.supportedLocales,
              locale: _getLocale(localizationState),
            ),
          );
        },
      ),
    );
  }

  // TODO: ugly work around improve by implementing Navigator 2.0
  Future<void> _initialNavigation(
    BuildContext context,
  ) async {
    if (!needNavigation) {
      return;
    }
    final state = context.read<AppCubit>().state;
    if (state is! AppLoaded) {
      return;
    }
    needNavigation = false;
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (state.hasNotAcceptedIntro) {
        IntroductionPage.pushReplacement(context);
        return;
      }
      if (state.hasNoActiveRoute) {
        SelectInterestsPage.pushReplacement(context);
        return;
      }
      SelectInterestsPage.pushReplacement(
        context,
        animation: false,
      );
      if (state.hasCompletedRoute) {
        CompletedPage.push(
          context,
          routeId: state.route!.id!,
        );
      }
      GuidePage.push(
        context,
        arguments: const OpenRouteGuidePageArguments(),
      );
    });
  }

  Locale _getLocale(
    LocalizationState state,
  ) {
    return state is LocalizationLoaded
        ? state.locale.toLocale()
        : AppLocalizations.supportedLocales.first;
  }
}
