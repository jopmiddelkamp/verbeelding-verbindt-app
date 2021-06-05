import 'package:rxdart/rxdart.dart';
import 'package:verbeelding_verbindt_core/entities/common/speciality.dart';
import 'package:verbeelding_verbindt_core/repositories/speciality_repository.dart';

import '../../../../shared/bloc/cubit_base.dart';
import 'select_interests_state.dart';

class SelectInterestsCubit extends CubitBase<SelectInterestsState> {
  SelectInterestsCubit({
    required SpecialityRepository specialityRepository,
  })  : _specialityRepository = specialityRepository,
        super(SelectInterestsState.initialize()) {
    _init();
  }

  final SpecialityRepository _specialityRepository;

  void _init() {
    _specialityRepository
        .getSpecialities()
        .takeUntil(dispose$)
        .listen(_loadSpecialities);
  }

  void _loadSpecialities(
    List<SpecialityEntity> specialities,
  ) {
    emit(SelectInterestsState.load(
      specialities,
    ));
  }

  void toggleSpeciality(
    String? specialityId,
  ) {
    if (specialityId == null) {
      return;
    }
    final selectedIds = state.selectedSpecialityIds.toList();
    final index = selectedIds.indexOf(specialityId);
    if (index > -1) {
      selectedIds.removeAt(index);
    } else {
      selectedIds.add(specialityId);
    }
    emit(state.copyWith(
      selectedSpecialityIds: selectedIds,
    ));
  }

  void toggleSelectionConfirmation() {
    emit(state.copyWith(
      selectionConfirmed: !state.selectionConfirmed,
    ));
  }
}
