import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/extensions/build_context_extensions.dart';
import '../../../../../common/widgets/list_tiles/list_tile.dart';
import '../../../../../common/widgets/loading_indicators/circle_loading_indicator.dart';
import '../bloc/barrel.dart';

class SpecialitiesList extends StatelessWidget {
  const SpecialitiesList({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocBuilder<PageCubit, PageState>(
      builder: (context, state) {
        if (!state.specialitiesLoaded) {
          return const VVCircleLoadingIndicator();
        }
        if (!state.hasSpecialities) {
          return const Center(
            child: Text('No specialities to display..'),
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
                context.blocProvider<PageCubit>().toggleSpeciality(category.id);
              },
              selected: state.selectedSpecialityIds.contains(category.id),
            );
          },
        );
      },
    );
  }
}
