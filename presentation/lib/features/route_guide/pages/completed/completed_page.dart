import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get_it/get_it.dart';
import 'package:verbeelding_verbindt_presentation/features/route_guide/pages/completed/dialogs/confirm_lose_progress_dialog.dart';

import '../../../../shared/widgets/loading_indicators/circle_loading_indicator.dart';
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

  static const String routeName = '/route_guide/completed';

  @override
  Widget build(
    BuildContext context,
  ) {
    return WillPopScope(
      onWillPop: () {
        return showConfirmLoseProgressDialog(context);
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
      return VVCircleLoadingIndicator(
        label: 'Bezig met laden..',
      );
    }
    final content = state.content!;
    return Column(
      children: <Widget>[
        Header(
          image: content.headerImage,
          title: Text('Goed gedaan!'),
        ),
        Expanded(
          child: Markdown(
            data: content.text.value,
            padding: const EdgeInsets.all(16),
          ),
        ),
      ],
    );
  }
}
