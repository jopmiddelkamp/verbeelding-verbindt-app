import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../../verbeelding_verbindt_ui.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  static const String name = 'intro';
  static const String path = '/intro';

  static void go(BuildContext context) => context.goNamed(name);

  BlocProvider<IntroductionCubit> _blocProvider(
    WidgetBuilder builder,
  ) {
    return BlocProvider(
      create: (_) => IntroductionCubit(
        acceptIntroUseCase: GetIt.instance(),
        getIsIntroAcceptedUseCase: GetIt.instance(),
      )..init(),
      child: Builder(builder: builder),
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return _blocProvider((context) {
      return Scaffold(
        body: BlocBuilder<IntroductionCubit, IntroductionState>(
          builder: (context, state) {
            return state.map(
              initializing: (_) => const VVCircleLoadingIndicator(),
              loaded: (_) => _buildBody(context),
              failed: (_) => const FailureStateDisplay(),
            );
          },
        ),
      );
    });
  }

  Widget _buildBody(
    BuildContext context,
  ) {
    return Column(
      children: <Widget>[
        const IntroductionPageHeader(),
        Expanded(
          child: Markdown(
            data: context.l10n.pageIntroText,
            padding: const EdgeInsets.all(PaddingSize.medium),
          ),
        ),
        const SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(PaddingSize.medium),
            child: IntroductionPageContinueButton(),
          ),
        ),
      ],
    );
  }
}
