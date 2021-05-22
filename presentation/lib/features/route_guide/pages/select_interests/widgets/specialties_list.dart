import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/extensions/build_context_extensions.dart';
import '../../../../../shared/widgets/list_tiles/list_tile.dart';
import '../../../../../shared/widgets/loading_indicators/circle_loading_indicator.dart';
import '../../../../../shared/widgets/text/translatable_text.dart';
import '../select_interests_cubit.dart';
import '../select_interests_state.dart';

class SpecialitiesList extends StatelessWidget {
  const SpecialitiesList({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocBuilder<SelectInterestsCubit, SelectInterestsState>(
      builder: (context, state) {
        if (!state.specialitiesLoaded) {
          return VVCircleLoadingIndicator(
            text: (c, _) => c.l10n.selectInterestsPage.busyLoadingInterests,
          );
        }
        if (!state.hasSpecialities) {
          return Center(
            child: TranslatedText(
              (c, _) => c.l10n.selectInterestsPage.noInterestsToDisplay,
            ),
          );
        }
        return ListView.builder(
          itemCount: state.specialities!.length,
          itemBuilder: (context, index) {
            final category = state.specialities![index];
            return VVListTile(
              title: Text(
                category.name.value,
              ),
              onTap: () {
                context
                    .blocProvider<SelectInterestsCubit>()
                    .toggleSpeciality(category.id);
              },
              selected: state.selectedSpecialityIds.contains(category.id),
            );
          },
        );
      },
    );
  }
}
