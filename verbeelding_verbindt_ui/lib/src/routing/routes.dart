import 'package:go_router/go_router.dart';

import '../../verbeelding_verbindt_ui.dart';

final kRoutes = [
  GoRoute(
    name: IntroductionPage.name,
    path: IntroductionPage.path,
    builder: (_, __) => const IntroductionPage(),
  ),
  GoRoute(
    name: SelectInterestsPage.name,
    path: SelectInterestsPage.path,
    builder: (_, __) => const SelectInterestsPage(),
  ),
  GoRoute(
    name: StepsOverviewPage.name,
    path: StepsOverviewPage.path,
    builder: (_, __) => const StepsOverviewPage(),
    routes: [
      GoRoute(
        name: StepDetailsPage.name,
        path: StepDetailsPage.path,
        builder: (_, state) => StepDetailsPage(
          StepDetailsParams.fromParams(state.params),
        ),
      ),
      GoRoute(
        name: StepScanQrCodePage.name,
        path: StepScanQrCodePage.path,
        builder: (_, state) => StepScanQrCodePage(
          StepScanQrCodeParams.fromParams(state.params),
        ),
      ),
    ],
  ),
  GoRoute(
    name: CompletedPage.name,
    path: CompletedPage.path,
    builder: (_, __) => const CompletedPage(),
  ),
];
