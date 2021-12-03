import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef BlocWidgetBuilder2<S1, S2> = Widget Function(
  BuildContext context,
  S1 state1,
  S2 state2,
);

class BlocBuilder2<B1 extends BlocBase<S1>, S1, B2 extends BlocBase<S2>, S2>
    extends StatelessWidget {
  const BlocBuilder2({
    required this.builder,
    this.bloc1,
    this.bloc2,
    this.buildWhen1,
    this.buildWhen2,
    Key? key,
  }) : super(key: key);

  final BlocWidgetBuilder2<S1, S2> builder;
  final B1? bloc1;
  final B2? bloc2;
  final BlocBuilderCondition<S1>? buildWhen1;
  final BlocBuilderCondition<S2>? buildWhen2;

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocBuilder<B1, S1>(
      bloc: bloc1,
      buildWhen: buildWhen1,
      builder: (_, state1) {
        return BlocBuilder<B2, S2>(
          bloc: bloc2,
          buildWhen: buildWhen2,
          builder: (context, state2) {
            return builder(context, state1, state2);
          },
        );
      },
    );
  }
}
