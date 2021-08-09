import 'package:flutter/material.dart';

import '../../extensions/build_context_extensions.dart';

class RichSafeArea extends StatelessWidget {
  final Widget child;
  final Color? color;

  const RichSafeArea({
    required this.child,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      color: color ?? context.theme.colorScheme.background,
      child: SafeArea(
        child: child,
      ),
    );
  }
}
