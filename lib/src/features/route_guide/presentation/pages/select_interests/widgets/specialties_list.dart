import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../shared/presentation/extensions/build_context_extensions.dart';
import '../../../../../../shared/presentation/widgets/list_tiles/list_tile.dart';
import '../../../../../../shared/presentation/widgets/loading_indicators/circle_loading_indicator.dart';
import '../bloc/barrel.dart';

class SpecialitiesList extends StatelessWidget {
  const SpecialitiesList({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocBuilder<SelectInterestsCubit, SelectInterestsState>(
      builder: (context, state) {
        if (!state.specialitiesLoaded) {
          return const VVCircleLoadingIndicator(
            label: 'Bezig met het laden van interesses..',
          );
        }
        if (!state.hasSpecialities) {
          return const Center(
            child: Text('Geen interesses om weer te geven..'),
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
