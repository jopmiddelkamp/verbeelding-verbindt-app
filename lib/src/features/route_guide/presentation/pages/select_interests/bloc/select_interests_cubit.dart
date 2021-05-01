import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/models/speciality_model.dart';
import '../../../../domain/services/speciality_service.dart';
import 'barrel.dart';

class SelectInterestsCubit extends Cubit<SelectInterestsState> {
  SelectInterestsCubit({
    required SpecialityService specialityService,
  })   : _specialityService = specialityService,
        super(SelectInterestsState.initialize()) {
    _init();
  }

  final SpecialityService _specialityService;

  late StreamSubscription _specialitiesStreamSub;

  void _init() {
    _specialitiesStreamSub =
        _specialityService.getSpecialities().listen(_loadSpecialities);
  }

  void _loadSpecialities(
    List<SpecialityModel> specialities,
  ) {
    emit(SelectInterestsState.load(specialities));
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

  @override
  Future<void> close() {
    _specialitiesStreamSub.cancel();
    return super.close();
  }
}
