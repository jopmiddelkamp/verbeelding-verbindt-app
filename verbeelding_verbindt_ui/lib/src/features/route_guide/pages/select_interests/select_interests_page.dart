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

  static const String routeName = 'route_guide_select_interests';

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: TranslatedText(
          (c, _) => c.l10n.selectInterestsPage.title,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TranslatedText(
              (c, _) => c.l10n.selectInterestsPage.makeYourSelection,
            ),
            const SizedBox(height: 16),
            const Expanded(
              child: SelectInterestsPageSpecialitiesList(),
            ),
            const SizedBox(height: 16),
            const Divider(height: 2),
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
