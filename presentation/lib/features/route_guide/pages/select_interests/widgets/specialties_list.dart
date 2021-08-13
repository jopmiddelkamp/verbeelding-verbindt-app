import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verbeelding_verbindt_core/entities/common/speciality.dart';

import '../../../../../shared/extensions/build_context_extensions.dart';
import '../../../../../shared/widgets/bloc/failure_state_display.dart';
import '../../../../../shared/widgets/list_tiles/list_tile.dart';
import '../../../../../shared/widgets/loading_indicators/circle_loading_indicator.dart';
import '../../../../../shared/widgets/text/translatable_text.dart';
import '../../../blocs/speciality/bloc.dart';

class SpecialitiesList extends StatelessWidget {
  const SpecialitiesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocBuilder<SpecialityCubit, SpecialityState>(
      builder: (context, state) {
        return state.map(
          initializing: (_) => _buildLoadingIndicator(),
          loaded: (state) {
            if (state.specialities.isEmpty) {
              return _buildNoResults();
            }
            return _buildList(
              context,
              state: state,
            );
          },
          failed: (_) => const FailureStateDisplay(),
        );
      },
    );
  }

  Widget _buildLoadingIndicator() {
    return VVCircleLoadingIndicator(
      text: (c, _) => c.l10n.selectInterestsPage.busyLoadingInterests,
    );
  }

  Widget _buildNoResults() {
    return Center(
      child: TranslatedText(
        (c, _) => c.l10n.selectInterestsPage.noInterestsToDisplay,
      ),
    );
  }

  Widget _buildList(
    BuildContext context, {
    required SpecialityLoaded state,
  }) {
    return ListView.builder(
      itemCount: state.specialities.length,
      itemBuilder: (_, index) {
        return _buildListItem(
          context,
          specialty: state.specialities[index],
          state: state,
        );
      },
    );
  }

  Widget _buildListItem(
    BuildContext context, {
    required SpecialityEntity specialty,
    required SpecialityLoaded state,
  }) {
    return VVListTile(
      title: Text(
        specialty.name.value,
      ),
      onTap: () {
        final cubit = context.cubit<SpecialityCubit>();
        cubit.toggle(
          specialty,
        );
      },
      selected: state.isSelected(
        specialty,
      ),
    );
  }
}
