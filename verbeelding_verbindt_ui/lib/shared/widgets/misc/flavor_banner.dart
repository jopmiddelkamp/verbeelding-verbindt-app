import 'package:flutter/material.dart';
import 'package:verbeelding_verbindt_core/aliases.dart';
import 'package:verbeelding_verbindt_core/entities/environment_enum.dart';
import 'package:verbeelding_verbindt_core/utils/enum_utils.dart';

import '../../dialogs/device_info/device_info_dialog.dart';

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
    final environment = serviceLocator<Environment>();
    if (environment.isProduction) {
      return child;
    }
    return Stack(
      children: <Widget>[
        child,
        _buildBanner(
          context,
          env: environment,
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
