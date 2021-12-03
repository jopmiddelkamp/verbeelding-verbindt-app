import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../../verbeelding_verbindt_ui.dart';

class CompletedPage extends StatelessWidget {
  const CompletedPage._();

  static Widget bloc({
    required String routeId,
    DeleteRouteUseCase? deleteRouteUseCase,
  }) {
    return BlocProvider(
      create: (_) => CompletedCubit(
        routeId: routeId,
        deleteRouteUseCase: deleteRouteUseCase ?? GetIt.instance(),
      ),
      child: const CompletedPage._(),
    );
  }

  static const String routeName = 'route_guide_completed';

  @override
  Widget build(
    BuildContext context,
  ) {
    final cubit = context.read<CompletedCubit>();
    return WillPopScope(
      onWillPop: () async {
        final result = await showConfirmDialog(
          context,
          content: (c, _) => c.l10n.pageCompletedPopConfirmMessage,
        );
        if (result) {
          await cubit.deleteRoute();
        }
        return result;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        const CompletedPageHeader(),
        Expanded(
          child: TranslatedMarkdown(
            (c, _) => c.l10n.pageCompletedText,
            padding: const EdgeInsets.all(16),
          ),
        ),
      ],
    );
  }
}
