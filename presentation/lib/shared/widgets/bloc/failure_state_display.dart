import 'package:flutter/material.dart';
import 'package:verbeelding_verbindt_core/failures/failure.dart';

class FailureStateDisplay extends StatelessWidget {
  const FailureStateDisplay({
    this.failure,
    Key? key,
  }) : super(key: key);

  final Failure? failure;

  @override
  Widget build(
    BuildContext context,
  ) {
    return const Text('Joe joe');
  }
}
