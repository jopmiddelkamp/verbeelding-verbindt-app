import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get_it/get_it.dart';

import '../../../../../verbeelding_verbindt_ui.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage._();

  static Widget bloc() {
    return BlocProvider(
      create: (_) => IntroductionCubit(
        acceptIntroUseCase: GetIt.instance(),
        getIsIntroAcceptedUseCase: GetIt.instance(),
      )..init(),
      child: BlocListener<IntroductionCubit, IntroductionState>(
        listener: (context, state) async {
          if (state is IntroductionLoaded && state.accepted) {
            await SelectInterestsPage.pushReplacement(context);
          }
        },
        child: const IntroductionPage._(),
      ),
    );
  }

  static Future<void> pushReplacement(
    BuildContext context,
  ) {
    return context.navigator.pushReplacementNamed(
      IntroductionPage.routeName,
    );
  }

  static const String routeName = 'intro_intro';

  @override
  Widget build(
    BuildContext context,
  ) {
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
            padding: const EdgeInsets.all(16),
          ),
        ),
        const SizedBox(
          width: double.infinity,
          child: IntroductionPageContinueButton(
            // TODO: default margin define somewhere with styling
            margin: EdgeInsets.all(16),
          ),
        ),
      ],
    );
  }
}
