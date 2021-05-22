import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:verbeelding_verbindt_presentation/shared/widgets/text/translatable_text.dart';

import '../../../../shared/extensions/build_context_extensions.dart';
import '../guide/guide_page.dart';
import 'select_interests_cubit.dart';
import 'select_interests_state.dart';
import 'widgets/continue_button.dart';
import 'widgets/specialties_list.dart';

final serviceLocator = GetIt.instance;

class SelectInterestsPage extends StatelessWidget {
  SelectInterestsPage._();

  static const String routeName = '/route_guide/select-interests';

  static Widget blocProvider() {
    return BlocProvider(
      create: (context) => SelectInterestsCubit(
        specialityRepository: serviceLocator(),
      ),
      child: BlocListener<SelectInterestsCubit, SelectInterestsState>(
        listener: (context, state) async {
          if (state.selectionConfirmed) {
            await _navigateToRoutePage(context, state);
            context
                .blocProvider<SelectInterestsCubit>()
                .toggleSelectionConfirmation();
          }
        },
        child: SelectInterestsPage._(),
      ),
    );
  }

  static Future _navigateToRoutePage(
    BuildContext context,
    SelectInterestsState state,
  ) {
    return context.navigator.pushNamed(
      GuidePage.routeName,
      arguments: CreateRoutePageArguments(
        selectedSpecialityIds: state.selectedSpecialityIds,
      ),
    );
  }

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
            Expanded(
              child: SpecialitiesList(),
            ),
            const SizedBox(height: 16),
            const Divider(height: 2),
            Container(
              width: double.infinity,
              child: ContinueButton(),
            ),
          ],
        ),
      ),
    );
  }
}
