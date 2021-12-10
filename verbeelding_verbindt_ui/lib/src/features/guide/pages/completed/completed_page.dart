import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get_it/get_it.dart';

import '../../../../../verbeelding_verbindt_ui.dart';

class CompletedPage extends StatelessWidget {
  const CompletedPage._();

  static Widget bloc() {
    return BlocProvider(
      create: (_) {
        return GuideCubit(
          createRouteUseCase: GetIt.instance(),
          deleteRouteUseCase: GetIt.instance(),
          getUsersRouteUseCase: GetIt.instance(),
          nextRouteStopUseCase: GetIt.instance(),
          locationService: GetIt.instance(),
        )..loadRoute();
      },
      child: const CompletedPage._(),
    );
  }

  static Future<void> push(
    BuildContext context, {
    required String routeId,
  }) {
    return context.navigator.pushNamed(
      routeName,
      arguments: routeId,
    );
  }

  static const String routeName = 'route_guide_completed';

  @override
  Widget build(
    BuildContext context,
  ) {
    final cubit = context.read<GuideCubit>();
    return WillPopScope(
      onWillPop: () async {
        final result = await showConfirmDialog(
          context,
          content: context.l10n.pageCompletedPopConfirmMessage,
        );
        if (result) {
          await cubit.delete();
        }
        return result;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
  ) {
    return Column(
      children: <Widget>[
        const CompletedPageHeader(),
        Expanded(
          child: Markdown(
            data: context.l10n.pageCompletedText,
            padding: const EdgeInsets.all(16),
          ),
        ),
      ],
    );
  }
}
