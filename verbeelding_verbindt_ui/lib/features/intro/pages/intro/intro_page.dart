import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verbeelding_verbindt_core/aliases.dart';

import '../../../../features/route_guide/pages/select_interests/select_interests_page.dart';
import '../../../../shared/extensions/build_context_extensions.dart';
import '../../../../shared/widgets/bloc/failure_state_display.dart';
import '../../../../shared/widgets/loading_indicators/circle_loading_indicator.dart';
import '../../../../shared/widgets/text/translatable_markdown.dart';
import 'bloc/bloc.dart';
import 'widgets/continue_button.dart';
import 'widgets/header.dart';

class IntroPage extends StatelessWidget {
  const IntroPage._();

  static Widget blocProvider() {
    return BlocProvider(
      create: (_) => IntroCubit(
        acceptIntroUseCase: serviceLocator(),
        getIsIntroAcceptedUseCase: serviceLocator(),
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
            loaded: (_) => _buildBody(),
            failed: (_) => const FailureStateDisplay(),
          );
        },
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        const Header(),
        Expanded(
          child: TranslatedMarkdown(
            (c, _) => c.l10n.introPage.text,
            padding: const EdgeInsets.all(16),
          ),
        ),
        const SizedBox(
          width: double.infinity,
          child: ContinueButton(
            // TODO: default margin define somewhere with styleing
            margin: EdgeInsets.all(16),
          ),
        ),
      ],
    );
  }
}
