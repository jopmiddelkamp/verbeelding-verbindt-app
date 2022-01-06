import 'package:flutter/material.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

class FlavorBanner extends StatelessWidget {
  const FlavorBanner({
    required this.child,
    required this.environmentVariables,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final EnvironmentVariables environmentVariables;

  Environment get environment => environmentVariables.environment;

  @override
  Widget build(
    BuildContext context,
  ) {
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
