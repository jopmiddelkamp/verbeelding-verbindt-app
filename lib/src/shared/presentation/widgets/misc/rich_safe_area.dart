import 'package:flutter/material.dart';

import '../../extensions/build_context_extensions.dart';

class RichSafeArea extends StatelessWidget {
  final Widget child;
  final Color? color;

  const RichSafeArea({
    required this.child,
    this.color,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      color: color != null ? color : context.theme.colorScheme.background,
      child: SafeArea(
        child: child,
      ),
    );
  }
}
