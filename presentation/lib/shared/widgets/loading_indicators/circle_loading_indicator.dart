import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../extensions/build_context_extensions.dart';

class VVCircleLoadingIndicator extends StatelessWidget {
  const VVCircleLoadingIndicator({
    Key? key,
    this.size = 50,
    this.label,
  }) : super(key: key);

  final double size;
  final String? label;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SpinKitRing(
          color: context.theme.colorScheme.onBackground.withOpacity(0.25),
          lineWidth: size / 15,
          size: size,
        ),
        if (label != null) ...[
          SizedBox(height: size / 3),
          Text(
            label!,
            style: TextStyle(fontSize: size / 3),
          ),
        ],
      ],
    );
  }
}
