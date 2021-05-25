import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../shared/dialogs/confirm/confirm_dialog.dart';
import '../../../../shared/extensions/build_context_extensions.dart';
import '../../../../shared/widgets/loading_indicators/circle_loading_indicator.dart';
import '../../../../shared/widgets/text/translatable_markdown.dart';
import '../../../../shared/widgets/text/translatable_text.dart';
import 'completed_cubit.dart';
import 'completed_state.dart';
import 'widgets/header.dart';

final serviceLocator = GetIt.instance;

class CompletedPage extends StatelessWidget {
  CompletedPage._();

  static Widget blocProvider() {
    return BlocProvider(
      create: (context) => CompletedCubit(
        pageContentRepository: serviceLocator(),
      ),
      child: CompletedPage._(),
    );
  }

  static const String routeName = 'route_guide_completed';

  @override
  Widget build(
    BuildContext context,
  ) {
    return WillPopScope(
      onWillPop: () {
        return showConfirmDialog(
          context,
          content: (c, _) => c.l10n.completedPage.popConfirmMessage,
        );
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: BlocBuilder<CompletedCubit, CompletedState>(
          builder: (context, state) {
            return _buildBody(state);
          },
        ),
      ),
    );
  }

  Widget _buildBody(
    CompletedState state,
  ) {
    if (!state.loaded) {
      return VVCircleLoadingIndicator();
    }
    final content = state.content!;
    return Column(
      children: <Widget>[
        Header(
          image: content.headerImage,
          title: TranslatedText(
            (c, _) => c.l10n.completedPage.title,
          ),
        ),
        Expanded(
          child: TranslatedMarkdown(
            (c, _) => c.l10n.completedPage.text,
            padding: const EdgeInsets.all(16),
          ),
        ),
      ],
    );
  }
}
