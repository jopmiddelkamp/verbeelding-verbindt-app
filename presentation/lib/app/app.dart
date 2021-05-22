import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:verbeelding_verbindt_presentation/shared/dialogs/device_info/l10n/generated/device_info_dialog_localizations.dart';
import 'package:verbeelding_verbindt_presentation/shared/dialogs/error_dialog/l10n/generated/error_dialog_localizations.dart';

import '../features/intro/pages/intro/intro_page.dart';
import '../features/intro/pages/intro/l10n/generated/intro_page_localizations.dart';
import '../features/route_guide/pages/artist_details/l10n/generated/artist_details_page_localizations.dart';
import '../features/route_guide/pages/completed/l10n/generated/completed_page_localizations.dart';
import '../features/route_guide/pages/guide/l10n/generated/guide_page_localizations.dart';
import '../features/route_guide/pages/scan_qr/l10n/generated/scan_qr_page_localizations.dart';
import '../features/route_guide/pages/select_interests/l10n/generated/select_interests_page_localizations.dart';
import '../features/route_guide/pages/select_interests/select_interests_page.dart';
import '../routes.dart';
import '../shared/l10n/generated/shared_localizations.dart';
import '../shared/services/localization/localization_service.dart';
import '../shared/widgets/misc/flavor_banner.dart';
import '../theme.dart';
import 'app_cubit.dart';
import 'app_state.dart';

final serviceLocator = GetIt.instance;

class App extends StatelessWidget {
  App._();

  static Widget blocProvider({
    required GlobalKey<NavigatorState> navigatorKey,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit(
            persistentStorageService: serviceLocator(),
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
        final botToastBuilder = BotToastInit();
        return MaterialApp(
          title: 'Verbeelding Verbindt',
          theme: buildAppTheme(context),
          home: _buildHome(state),
          builder: (context, child) {
            return FlavorBanner(
              child: botToastBuilder(context, child),
              navigatorKey: state.navigatorKey,
            );
          },
          navigatorObservers: [
            BotToastNavigatorObserver(),
          ],
          onGenerateRoute: onGenerateRoute,
          navigatorKey: state.navigatorKey,
          localizationsDelegates: [
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
          ],
          supportedLocales: SharedLocalizations.supportedLocales,
          localeResolutionCallback: (_, __) {
            final localizationService = serviceLocator<LocalizationService>();
            return Locale(localizationService.currentLocale.languageCode);
          },
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
