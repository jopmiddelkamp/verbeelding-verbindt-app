import 'package:rxdart/rxdart.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../../../verbeelding_verbindt_ui.dart';

class SelectedInterestsCubit extends CubitBase<SelectedInterestsState> {
  SelectedInterestsCubit({
    required StreamSpecialitiesUseCase streamSpecialitiesUseCase,
  })  : _streamSpecialitiesUseCase = streamSpecialitiesUseCase,
        super(const SelectedInterestsState.initializing());

  final StreamSpecialitiesUseCase _streamSpecialitiesUseCase;

  SelectedInterestsLoaded get loadedState => state as SelectedInterestsLoaded;

  Future<void> init() async {
    final specialtiesStream = await _streamSpecialitiesUseCase(null);
    specialtiesStream.takeUntil(close$).listen(_loadSpecialities);
  }

  void _loadSpecialities(
    List<SpecialityGeoLocation> specialities,
  ) {
    emit(SelectedInterestsState.loaded(
      specialities: specialities,
    ));
  }

  void toggle(
    SpecialityGeoLocation speciality,
  ) {
    if (state is! SelectedInterestsLoaded) {
      return;
    }
    final selectedSpecialities = loadedState.selectedSpecialities.toList();
    selectedSpecialities.addOrRemove(speciality);
    emit(SelectedInterestsState.loaded(
      specialities: loadedState.specialities,
      selectedSpecialities: selectedSpecialities,
    ));
  }

  void reset() {
    if (state is! SelectedInterestsLoaded) {
      return;
    }
    emit(SelectedInterestsState.loaded(
      specialities: loadedState.specialities,
    ));
  }
}
