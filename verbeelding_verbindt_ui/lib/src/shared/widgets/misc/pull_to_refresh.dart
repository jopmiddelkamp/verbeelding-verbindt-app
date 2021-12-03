import 'package:flutter/material.dart';

import '../../../../verbeelding_verbindt_ui.dart';

class MTPPullToRefresh extends StatelessWidget {
  final RefreshCallback onRefresh;
  final Widget child;

  const MTPPullToRefresh({
    Key? key,
    required this.onRefresh,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    final theme = context.theme;
    return RefreshIndicator(
      onRefresh: onRefresh,
      backgroundColor: theme.colorScheme.primary,
      color: theme.colorScheme.onPrimary,
      child: _buildChild(),
    );
  }

  Widget _buildChild() {
    if (child is ScrollView) {
      return child;
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            height: constraints.maxHeight,
            child: child,
          ),
        );
      },
    );
  }
}
