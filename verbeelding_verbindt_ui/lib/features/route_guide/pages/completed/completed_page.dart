import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verbeelding_verbindt_core/aliases.dart';
import 'package:verbeelding_verbindt_core/use_cases/route/delete_route_use_case.dart';

import '../../../../shared/dialogs/confirm/confirm_dialog.dart';
import '../../../../shared/extensions/build_context_extensions.dart';
import '../../../../shared/widgets/text/translatable_markdown.dart';
import 'bloc/bloc.dart';
import 'widgets/header.dart';

class CompletedPage extends StatelessWidget {
  const CompletedPage._();

  static Widget bloc({
    required String routeId,
    DeleteRouteUseCase? deleteRouteUseCase,
  }) {
    return BlocProvider(
      create: (_) => CompletedCubit(
        routeId: routeId,
        deleteRouteUseCase: deleteRouteUseCase ?? serviceLocator(),
      ),
      child: const CompletedPage._(),
    );
  }

  static const String routeName = 'route_guide_completed';

  @override
  Widget build(
    BuildContext context,
  ) {
    final cubit = context.cubit<CompletedCubit>();
    return WillPopScope(
      onWillPop: () async {
        final result = await showConfirmDialog(
          context,
          content: (c, _) => c.l10n.completedPage.popConfirmMessage,
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
        const Header(),
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
