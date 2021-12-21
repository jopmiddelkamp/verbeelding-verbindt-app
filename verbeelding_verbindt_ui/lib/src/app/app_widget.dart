import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../verbeelding_verbindt_ui.dart';

class App extends StatefulWidget {
  const App({
    required this.appCubit,
    required this.localizationCubit,
    Key? key,
  }) : super(key: key);

  final AppCubit appCubit;
  final LocalizationCubit localizationCubit;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late GoRouter router;

  @override
  void initState() {
    super.initState();
    router = GoRouter(
      initialLocation: StepsOverviewPage.path,
      routes: kRoutes,
      urlPathStrategy: UrlPathStrategy.path,
      debugLogDiagnostics: kDebugMode,
      redirect: (state) => topLevelGuard(widget.appCubit.state, state),
      refreshListenable: GoRouterRefreshStream(
        widget.appCubit.stream,
      ),
    );
  }

  MultiBlocProvider _blocProvider(
    WidgetBuilder builder,
  ) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: widget.appCubit),
        BlocProvider.value(value: widget.localizationCubit),
      ],
      child: Builder(builder: builder),
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final theme = CustomThemeData(
      colorScheme: kDefaultThemeColorSchemeLight,
    );
    return _blocProvider((context) {
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
              child: MaterialApp.router(
                title: 'Verbeelding Verbindt',

                // theming
                theme: theme.materialTheme,

                // Routing
                routerDelegate: router.routerDelegate,
                routeInformationParser: router.routeInformationParser,

                // Localization
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  AppLocalizations.delegate,
                ],
                supportedLocales: AppLocalizations.supportedLocales,
                locale: _getLocale(localizationState),

                // Environment identifier
                builder: (context, child) {
                  return FlavorBanner(
                    child: child!,
                    environmentVariables: GetIt.instance(),
                  );
                },
              ),
            );
          },
        ),
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
