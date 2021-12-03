import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../../../verbeelding_verbindt_ui.dart';

class SelectInterestsPageSpecialitiesList extends StatelessWidget {
  const SelectInterestsPageSpecialitiesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocBuilder<SelectedInterestsCubit, SelectedInterestsState>(
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
      text: (c, _) => c.l10n.pageSelectInterestsBusyLoadingInterests,
    );
  }

  Widget _buildNoResults() {
    return Center(
      child: TranslatedText(
        (c, _) => c.l10n.pageSelectInterestsNoInterestsToDisplay,
      ),
    );
  }

  Widget _buildList(
    BuildContext context, {
    required SelectedInterestsLoaded state,
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
    required SelectedInterestsLoaded state,
  }) {
    return VVListTile(
      title: Text(
        specialty.name.value,
      ),
      onTap: () {
        final cubit = context.cubit<SelectedInterestsCubit>();
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
