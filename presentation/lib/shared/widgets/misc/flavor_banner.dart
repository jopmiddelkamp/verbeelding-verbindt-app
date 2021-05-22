import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:verbeelding_verbindt_core/entities/common/environment.dart';
import 'package:verbeelding_verbindt_core/enums/environment_enum.dart';
import 'package:verbeelding_verbindt_core/utils/enum_utils.dart';

import '../../dialogs/device_info/device_info_dialog.dart';

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
    final env = serviceLocator<EnvironmentEntity>().environment;
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
