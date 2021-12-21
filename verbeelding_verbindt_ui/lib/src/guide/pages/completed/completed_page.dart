import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../../verbeelding_verbindt_ui.dart';

class CompletedPage extends StatelessWidget {
  const CompletedPage({Key? key}) : super(key: key);

  static const String name = 'route_guide_completed';
  static const String path = '/guide/completed';

  static void go(BuildContext context) => context.goNamed(name);

  BlocProvider<StepsOverviewCubit> _blocProvider(
    WidgetBuilder builder,
  ) {
    return BlocProvider(
      create: (_) {
        return StepsOverviewCubit(
          deleteRouteUseCase: GetIt.instance(),
          getUsersRouteUseCase: GetIt.instance(),
          completeRouteStopUseCase: GetIt.instance(),
          locationService: GetIt.instance(),
        )..loadRoute();
      },
      child: Builder(builder: builder),
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return _blocProvider((context) {
      final cubit = context.read<StepsOverviewCubit>();
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () async {
              final result = await showConfirmDialog(
                context,
                content: context.l10n.pageCompletedPopConfirmMessage,
              );
              if (result) {
                await cubit.delete();
              }
            },
          ),
        ),
        body: _buildBody(context),
      );
    });
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
            padding: const EdgeInsets.all(PaddingSize.medium),
          ),
        ),
      ],
    );
  }
}
