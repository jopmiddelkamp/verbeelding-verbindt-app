import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../environment_variable.dart';
import '../../../domain/utils/enum_utils.dart';
import '../../dialogs/device_info.dialog.dart';

final serviceLocator = GetIt.instance;

class FlavorBanner extends StatelessWidget {
  final Widget child;
  final GlobalKey<NavigatorState> navigatorKey;

  const FlavorBanner({
    required this.child,
    required this.navigatorKey,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    final env = serviceLocator<EnvironmentVariables>().environment;
    if (env == Environment.prod) {
      return child;
    }
    return Stack(
      children: <Widget>[
        child,
        _buildBanner(
          context,
          env: env,
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
      child: Container(
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
      case Environment.dev:
        return Colors.lightBlue;
      default:
        return Colors.orange;
    }
  }
}
