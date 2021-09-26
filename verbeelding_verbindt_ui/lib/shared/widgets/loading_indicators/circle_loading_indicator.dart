import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../extensions/build_context_extensions.dart';
import '../text/translatable_text.dart';

class VVCircleLoadingIndicator extends StatelessWidget {
  const VVCircleLoadingIndicator({
    Key? key,
    this.size = 50,
    this.text,
  }) : super(key: key);

  final double size;
  final TranslatedTextCallback? text;

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
        SizedBox(height: size / 3),
        TranslatedText(
          text ?? (c, _) => c.l10n.shared.busyLoading,
          style: TextStyle(
            fontSize: size / 3,
          ),
        ),
      ],
    );
  }
}
