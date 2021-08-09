import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verbeelding_verbindt_core/aliases.dart';

import '../../../../shared/extensions/build_context_extensions.dart';
import '../../../../shared/widgets/text/translatable_text.dart';
import '../../blocs/speciality/bloc.dart';
import 'widgets/continue_button.dart';
import 'widgets/specialties_list.dart';

class SelectInterestsPage extends StatelessWidget {
  const SelectInterestsPage._();

  static Widget blocProvider() {
    return BlocProvider(
      create: (_) => SpecialityCubit(
        streamSpecialitiesUseCase: serviceLocator(),
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
              child: SpecialitiesList(),
            ),
            const SizedBox(height: 16),
            const Divider(height: 2),
            const SizedBox(
              width: double.infinity,
              child: ContinueButton(),
            ),
          ],
        ),
      ),
    );
  }
}
