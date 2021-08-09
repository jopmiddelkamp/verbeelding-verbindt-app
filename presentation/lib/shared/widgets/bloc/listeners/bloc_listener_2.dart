import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef BlocWidgetListener2<S1, S2> = void Function(
  BuildContext context,
  S1 state1,
  S2 state2,
);

class BlocListener2<B1 extends BlocBase<S1>, S1, B2 extends BlocBase<S2>, S2>
    extends StatelessWidget {
  final BlocWidgetListener2<S1, S2> listener;
  final B1? bloc1;
  final B1? bloc2;
  final BlocListenerCondition<S1>? listenWhen1;
  final BlocListenerCondition<S1>? listenWhen2;
  final Widget child;

  const BlocListener2({
    Key? key,
    required this.listener,
    this.bloc1,
    this.bloc2,
    this.listenWhen1,
    this.listenWhen2,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocListener(
      bloc: bloc1,
      listenWhen: listenWhen1,
      listener: (context, state) {},
    );
  }
}
