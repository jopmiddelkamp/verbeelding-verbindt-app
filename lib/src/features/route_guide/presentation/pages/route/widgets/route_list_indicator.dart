import 'package:flutter/material.dart';

import '../../../../../../shared/presentation/extensions/build_context_extensions.dart';
import '../../../../../../shared/presentation/font_weight.dart';

class RouteListIndicator extends StatelessWidget {
  const RouteListIndicator({
    Key? key,
    required this.count,
    required this.index,
    required this.active,
  }) : super(key: key);

  final int count;
  final int index;
  final bool active;

  @override
  Widget build(
    BuildContext context,
  ) {
    final dark = context.theme.colorScheme.secondary;
    final light = context.theme.colorScheme.secondaryVariant;

    const width = 32.0;
    return SizedBox(
      width: width,
      height: width * 2,
      child: Stack(
        children: [
          if (index > 0)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: width * 0.75,
                child: Center(
                  child: Container(
                    height: double.infinity,
                    width: width / 8,
                    color: light,
                  ),
                ),
              ),
            ),
          if (index < count - 1)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: width * 0.75,
                child: Center(
                  child: Container(
                    height: double.infinity,
                    width: width / 8,
                    color: light,
                  ),
                ),
              ),
            ),
          Center(
            child: Transform.scale(
              scale: active ? 1 : 0.85,
              child: CircleAvatar(
                radius: width / 2,
                backgroundColor: active ? dark : light,
                foregroundColor: context.theme.colorScheme.onSecondary,
                child: Center(
                  child: Text(
                    (index + 1).toString(),
                    style: context.textTheme.bodyText2!.copyWith(
                      color: context.theme.colorScheme.onPrimary,
                      fontSize: width / 1.75,
                      fontWeight: VVFontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
