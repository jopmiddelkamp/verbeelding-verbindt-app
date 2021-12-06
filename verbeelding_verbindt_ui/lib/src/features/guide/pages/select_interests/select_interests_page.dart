import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../../verbeelding_verbindt_ui.dart';

class SelectInterestsPage extends StatelessWidget {
  const SelectInterestsPage._();

  static Widget bloc() {
    return BlocProvider(
      create: (_) => SelectedInterestsCubit(
        streamSpecialitiesUseCase: GetIt.instance(),
      )..init(),
      child: const SelectInterestsPage._(),
    );
  }

  static Future<void> pushReplacement(
    BuildContext context, {
    bool animation = true,
  }) {
    if (!animation) {
      return Navigator.pushReplacement(
        context,
        InstantMaterialPageRoute(builder: (_) {
          return SelectInterestsPage.bloc();
        }),
      );
    }
    return context.navigator.pushReplacementNamed(
      routeName,
    );
  }

  static const String routeName = 'route_guide_select_interests';

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.pageSelectInterestsTitle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
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
              child: SelectInterestsPageContinueButton(),
            ),
          ],
        ),
      ),
    );
  }
}
