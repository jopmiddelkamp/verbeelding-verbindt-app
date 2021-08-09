import 'package:rxdart/rxdart.dart';
import 'package:verbeelding_verbindt_core/entities/common/speciality.dart';
import 'package:verbeelding_verbindt_core/extensions/list_extensions.dart';
import 'package:verbeelding_verbindt_core/usecases/specialty/stream_specialties_use_case.dart';

import '../../../../shared/blocs/cubit_base.dart';
import 'speciality_state.dart';

class SpecialityCubit extends CubitBase<SpecialityState> {
  SpecialityCubit({
    required StreamSpecialitiesUseCase streamSpecialitiesUseCase,
  })  : _streamSpecialitiesUseCase = streamSpecialitiesUseCase,
        super(const SpecialityState.initializing());

  final StreamSpecialitiesUseCase _streamSpecialitiesUseCase;

  Future<void> init() async {
    final specialtiesStream = await _streamSpecialitiesUseCase.handle();
    specialtiesStream.takeUntil(close$).listen(_loadSpecialities);
  }

  void _loadSpecialities(
    List<SpecialityEntity> specialities,
  ) {
    emit(SpecialityState.loaded(
      specialities: specialities,
    ));
  }

  void toggle(
    SpecialityEntity speciality,
  ) {
    if (state is! SpecialityLoadedState) {
      return;
    }
    final loadedState = state as SpecialityLoadedState;
    final selectedSpecialities = loadedState.selectedSpecialities.toList();
    selectedSpecialities.addOrRemove(speciality);
    emit(SpecialityState.loaded(
      specialities: loadedState.specialities,
      selectedSpecialities: selectedSpecialities,
    ));
  }
}
