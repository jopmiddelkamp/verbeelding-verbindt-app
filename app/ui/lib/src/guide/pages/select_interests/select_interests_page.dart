import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../../verbeelding_verbindt_ui.dart';

class SelectInterestsPage extends StatelessWidget {
  const SelectInterestsPage({Key? key}) : super(key: key);

  static const String name = 'select_interests';

  static void go(BuildContext context) => context.goNamed(name);

  BlocProvider<SelectedInterestsCubit> _blocProvider(
    WidgetBuilder builder,
  ) {
    return BlocProvider(
      create: (_) => SelectedInterestsCubit(
        createRouteUseCase: GetIt.instance(),
        streamSpecialitiesUseCase: GetIt.instance(),
        locationService: GetIt.instance(),
      )..init(),
      child: Builder(builder: builder),
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return _blocProvider((context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            context.l10n.pageSelectInterestsTitle,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(PaddingSize.medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                context.l10n.pageSelectInterestsMakeYourSelection,
              ),
              const SizedBox(height: 16),
              const Expanded(
                child: SelectInterestsPageSpecialitiesList(),
              ),
              const SizedBox(height: 16),
              const SizedBox(
                width: double.infinity,
                child: SelectInterestsPageGenerateGuideButton(),
              ),
            ],
          ),
        ),
      );
    });
  }
}
