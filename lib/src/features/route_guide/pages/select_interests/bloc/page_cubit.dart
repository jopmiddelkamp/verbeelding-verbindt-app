import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/speciality_model.dart';
import '../../../services/speciality_service.dart';
import 'barrel.dart';

class PageCubit extends Cubit<PageState> {
  PageCubit({
    required SpecialityService specialityService,
  })   : _specialityService = specialityService,
        super(PageState.initialize()) {
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
    emit(PageState.load(specialities));
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

  @override
  Future<void> close() {
    _specialitiesStreamSub.cancel();
    return super.close();
  }
}
