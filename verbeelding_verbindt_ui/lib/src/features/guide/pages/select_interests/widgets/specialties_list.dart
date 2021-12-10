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
          initializing: (_) => _buildLoadingIndicator(context),
          loaded: (state) {
            if (state.specialities.isEmpty) {
              return _buildNoResults(context);
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

  Widget _buildLoadingIndicator(
    BuildContext context,
  ) {
    return VVCircleLoadingIndicator(
      text: context.l10n.pageSelectInterestsBusyLoadingInterests,
    );
  }

  Widget _buildNoResults(
    BuildContext context,
  ) {
    return Center(
      child: Text(
        context.l10n.pageSelectInterestsNoInterestsToDisplay,
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
    required SpecialityGeoLocation specialty,
    required SelectedInterestsLoaded state,
  }) {
    return VVListTile(
      title: Text(
        specialty.name.value,
      ),
      onTap: () {
        final cubit = context.read<SelectedInterestsCubit>();
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
