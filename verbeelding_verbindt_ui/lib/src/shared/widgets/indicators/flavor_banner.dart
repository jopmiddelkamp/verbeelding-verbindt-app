import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../verbeelding_verbindt_ui.dart';

class FlavorBanner extends StatelessWidget {
  final Widget child;
  final GlobalKey<NavigatorState> navigatorKey;

  const FlavorBanner({
    required this.child,
    required this.navigatorKey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    final envVars = GetIt.instance<EnvironmentVariables>();
    if (envVars.environment.isProduction) {
      return child;
    }
    return Stack(
      children: <Widget>[
        child,
        _buildBanner(
          context,
          env: envVars.environment,
        ),
      ],
    );
  }

  Widget _buildBanner(
    BuildContext context, {
    required Environment env,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        width: 50,
        height: 50,
        child: CustomPaint(
          painter: BannerPainter(
            message: EnumUtils.getStringValue(env).toUpperCase(),
            textDirection: Directionality.of(context),
            layoutDirection: Directionality.of(context),
            location: BannerLocation.topStart,
            color: _getColor(env),
          ),
        ),
      ),
      onLongPress: () {
        if (navigatorKey.currentContext != null) {
          showDeviceInfoDialog(navigatorKey.currentContext!);
        }
      },
    );
  }

  Color _getColor(
    Environment env,
  ) {
    switch (env) {
      case Environment.development:
        return Colors.lightBlue;
      default:
        return Colors.orange;
    }
  }
}
