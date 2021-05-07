import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get_it/get_it.dart';

import '../../../../features/route_guide/pages/select_interests/select_interests_page.dart';
import '../../../../shared/extensions/build_context_extensions.dart';
import '../../../../shared/widgets/loading_indicators/circle_loading_indicator.dart';
import 'intro_cubit.dart';
import 'intro_state.dart';
import 'widgets/continue_button.dart';
import 'widgets/header.dart';

final serviceLocator = GetIt.instance;

class IntroPage extends StatelessWidget {
  IntroPage._();

  static Widget blocProvider() {
    return BlocProvider(
      create: (context) => IntroCubit(
        persistentStorageService: serviceLocator(),
        pageContentRepository: serviceLocator(),
      ),
      child: BlocListener<IntroCubit, IntroState>(
        listener: (context, state) async {
          if (state.loaded && state.accepted == true) {
            await context.navigator.pushReplacementNamed(
              SelectInterestsPage.routeName,
            );
          }
        },
        child: IntroPage._(),
      ),
    );
  }

  static const String routeName = '/route_guide/intro';

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: BlocBuilder<IntroCubit, IntroState>(
        builder: (context, state) {
          return _buildBody(state);
        },
      ),
    );
  }

  Widget _buildBody(
    IntroState state,
  ) {
    if (!state.loaded) {
      return VVCircleLoadingIndicator(
        label: 'Bezig met laden..',
      );
    }
    final content = state.content!;
    return Column(
      children: <Widget>[
        Header(
          image: content.headerImage,
          title: content.title,
        ),
        Expanded(
          child: Markdown(
            data: content.text.value,
            padding: const EdgeInsets.all(16),
          ),
        ),
        Container(
          width: double.infinity,
          child: const ContinueButton(
            margin: EdgeInsets.all(16),
          ),
        ),
      ],
    );
  }
}
