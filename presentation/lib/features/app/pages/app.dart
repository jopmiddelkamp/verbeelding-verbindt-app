import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:verbeelding_verbindt_core/aliases.dart';
import 'package:verbeelding_verbindt_core/entities/common/locale.dart';
import 'package:verbeelding_verbindt_core/utils/enum_utils.dart';
import 'package:verbeelding_verbindt_presentation/features/app/blocs/app/app_cubit.dart';
import 'package:verbeelding_verbindt_presentation/features/app/blocs/app/app_state.dart';

import '../../../routes.dart';
import '../../../shared/barrels/localizations.dart';
import '../../../shared/blocs/localization/localization_cubit.dart';
import '../../../shared/blocs/permission/permission_cubit.dart';
import '../../../shared/extensions/build_context_extensions.dart';
import '../../../shared/widgets/misc/flavor_banner.dart';
import '../../../theme.dart';
import '../../intro/pages/intro/intro_page.dart';
import '../../route_guide/pages/guide/guide_page.dart';
import '../../route_guide/pages/select_interests/select_interests_page.dart';

class App extends HookWidget {
  const App._({
    required this.navigatorKey,
    required this.initialLocale,
  });

  static Widget blocProvider({
    required LocaleEntity initialLocale,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AppCubit(
            getHasUsersRouteUseCase: serviceLocator(),
            getIsIntroAcceptedUseCase: serviceLocator(),
            getAuthenticatedUserUseCase: serviceLocator(),
          )..init(),
        ),
        BlocProvider(
          create: (_) => LocalizationCubit(
            getActiveLocaleUseCase: serviceLocator(),
            setActiveLocaleUseCase: serviceLocator(),
          )..init(),
        ),
        BlocProvider(
          create: (_) => PermissionCubit(
            getPermissionStatusUseCase: serviceLocator(),
            requestPermissionUseCase: serviceLocator(),
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
    final botToastBuilder = BotToastInit();
    return MaterialApp(
      title: 'Verbeelding Verbindt',
      theme: buildAppTheme(context),
      home: BlocListener<AppCubit, AppState>(
        listener: _initialNavigationListener,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      builder: (context, child) {
        return FlavorBanner(
          child: botToastBuilder(context, child),
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
        // Shared
        SharedLocalizations.delegate,
        // Pages
        IntroPageLocalizations.delegate,
        ArtistDetailsPageLocalizations.delegate,
        GuidePageLocalizations.delegate,
        ScanQrPageLocalizations.delegate,
        SelectInterestsPageLocalizations.delegate,
        CompletedPageLocalizations.delegate,
        // Dialogs
        DeviceInfoDialogLocalizations.delegate,
        ErrorDialogLocalizations.delegate,
        NotImplementedDialogLocalizations.delegate,
        PermissionsDeniedDialogLocalizations.delegate,
        PermissionsRemovedDialogLocalizations.delegate,
        PermissionsRestrictedDialogLocalizations.delegate,
        ConfirmDialogLocalizations.delegate,
      ],
      supportedLocales: SharedLocalizations.supportedLocales,
      localeResolutionCallback: (_, __) {
        return Locale(
          EnumUtils.getStringValue(initialLocale.isoLanguage.languageCode),
        );
      },
    );
  }

  void _initialNavigationListener(
    BuildContext context,
    AppState state,
  ) {
    if (state is! AppLoaded) {
      return;
    }
    if (state.hasNotAcceptedIntro) {
      context.navigator.pushReplacementNamed(
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
    context.navigator.pushNamed(
      GuidePage.routeName,
      arguments: const OpenRouteGuidePageArguments(),
    );
  }
}
