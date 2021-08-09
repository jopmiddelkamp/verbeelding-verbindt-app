import 'package:verbeelding_verbindt_core/usecases/location/fetch_user_location_use_case.dart';

import '../cubit_base.dart';
import 'location_state.dart';

class LocationCubit extends CubitBase<LocationState> {
  LocationCubit({
    required FetchUserLocationUseCase fetchUserLocationUseCase,
  })  : _fetchUserLocationUseCase = fetchUserLocationUseCase,
        super(const LocationState.initializing());

  final FetchUserLocationUseCase _fetchUserLocationUseCase;

  Future<void> init() => fetchUserLocation();

  Future<void> fetchUserLocation() async {
    final location = await _fetchUserLocationUseCase.handle();
    emit(LocationState.loaded(
      location: location,
    ));
  }
}
