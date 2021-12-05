import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get_it/get_it.dart';

import '../../../../../verbeelding_verbindt_ui.dart';

class IntroPage extends StatelessWidget {
  const IntroPage._();

  static Widget bloc() {
    return BlocProvider(
      create: (_) => IntroCubit(
        acceptIntroUseCase: GetIt.instance(),
        getIsIntroAcceptedUseCase: GetIt.instance(),
      )..init(),
      child: BlocListener<IntroCubit, IntroState>(
        listener: (context, state) async {
          if (state is IntroLoaded && state.accepted) {
            await context.navigator.pushReplacementNamed(
              SelectInterestsPage.routeName,
            );
          }
        },
        child: const IntroPage._(),
      ),
    );
  }

  static const String routeName = 'intro_intro';

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: BlocBuilder<IntroCubit, IntroState>(
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
        const IntroPageHeader(),
        Expanded(
          child: Markdown(
            data: context.l10n.pageIntroText,
            padding: const EdgeInsets.all(16),
          ),
        ),
        const SizedBox(
          width: double.infinity,
          child: IntroPageContinueButton(
            // TODO: default margin define somewhere with styling
            margin: EdgeInsets.all(16),
          ),
        ),
      ],
    );
  }
}
