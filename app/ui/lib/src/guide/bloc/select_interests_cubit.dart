import 'package:rxdart/rxdart.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../../../verbeelding_verbindt_ui.dart';

class SelectedInterestsCubit extends CubitBase<SelectedInterestsState> {
  SelectedInterestsCubit({
    required CreateRouteUseCase createRouteUseCase,
    required StreamSpecialitiesUseCase streamSpecialitiesUseCase,
    required LocationService locationService,
  })  : _createRoute = createRouteUseCase,
        _streamSpecialities = streamSpecialitiesUseCase,
        _locationService = locationService,
        super(const SelectedInterestsState.initializing());

  final CreateRouteUseCase _createRoute;
  final StreamSpecialitiesUseCase _streamSpecialities;
  final LocationService _locationService;

  SelectedInterestsLoaded get loadedState => state as SelectedInterestsLoaded;

  Future<void> init() async {
    final specialtiesStream = _streamSpecialities(null);
    specialtiesStream.takeUntil(close$).listen(_loadSpecialities);
  }

  void _loadSpecialities(
    List<Speciality> specialities,
  ) {
    emit(SelectedInterestsState.loaded(
      specialities: specialities,
    ));
  }

  void toggle(
    Speciality speciality,
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

  Future<void> generateGuide() async {
    if (state is! SelectedInterestsLoaded || !loadedState.hasSelection) {
      return;
    }
    final result = await _locationService.requestPermissionIfNeeded();
    if (!result.isAlways && !result.isWhileInUse) {
      return;
    }
    final userLocation = await _locationService.getCurrentLocation();
    await _createRoute(
      CreateRouteUseCaseParams(
        selectedSpecialityIds: loadedState.selectedSelectedInterestsIds,
        userLocation: userLocation,
      ),
    );
  }
}
