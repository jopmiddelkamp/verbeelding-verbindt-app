import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../../verbeelding_verbindt_ui.dart';

class App extends StatefulWidget {
  const App._({
    required this.navigatorKey,
    required this.theme,
  });

  static Widget bloc({
    required AppCubit appCubit,
    required LocalizationCubit localizationCubit,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: appCubit),
        BlocProvider.value(value: localizationCubit),
      ],
      child: App._(
        navigatorKey: GlobalKey<NavigatorState>(),
        theme: CustomThemeData(
          colorScheme: kDefaultThemeColorSchemeLight,
        ),
      ),
    );
  }

  final GlobalKey<NavigatorState> navigatorKey;
  final CustomThemeData theme;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late bool needNavigation;

  @override
  void initState() {
    needNavigation = true;
    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
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
            data: widget.theme,
            child: MaterialApp(
              title: 'Verbeelding Verbindt',
              theme: widget.theme.materialTheme,
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
                  navigatorKey: widget.navigatorKey,
                );
              },
              onGenerateRoute: onGenerateRoute,
              navigatorKey: widget.navigatorKey,
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
