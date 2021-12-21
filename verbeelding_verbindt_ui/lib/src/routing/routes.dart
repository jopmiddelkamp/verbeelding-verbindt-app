import 'package:go_router/go_router.dart';

import '../../verbeelding_verbindt_ui.dart';

final kRoutes = [
  GoRoute(
    name: IntroductionPage.name,
    path: '/',
    builder: (_, __) => const IntroductionPage(),
  ),
  GoRoute(
    name: SelectInterestsPage.name,
    path: '/guide/select-interests',
    builder: (_, __) => const SelectInterestsPage(),
  ),
  GoRoute(
    name: StepsOverviewPage.name,
    path: '/guide/stops',
    builder: (_, __) => const StepsOverviewPage(),
    routes: [
      GoRoute(
        name: StepDetailsPage.name,
        path: ':${StepDetailsParams.indexKey}',
        builder: (_, state) => StepDetailsPage(
          StepDetailsParams.fromParams(state.params),
        ),
      ),
      GoRoute(
        name: StepScanQrCodePage.name,
        path: ':${StepScanQrCodeParams.stepIndexKey}/scan',
        builder: (_, state) => StepScanQrCodePage(
          StepScanQrCodeParams.fromParams(state.params),
        ),
      ),
    ],
  ),
  GoRoute(
    name: CompletedPage.name,
    path: '/guide/completed',
    builder: (_, __) => const CompletedPage(),
  ),
];
