import 'dart:async';

import '../../../verbeelding_verbindt_core.dart';

class CreateRouteUseCaseParams {
  CreateRouteUseCaseParams({
    required this.selectedSpecialityIds,
    required this.userLocation,
  });

  final List<String> selectedSpecialityIds;
  final Geolocation userLocation;
}

class CreateRouteUseCase
    extends UseCase<Future<void>, CreateRouteUseCaseParams> {
  CreateRouteUseCase({
    required ArtistRepository artistRepository,
    required RouteRepository routeRepository,
    required RouteGeneratorRepository routeGeneratorRepository,
    required AuthRepository authRepository,
  })  : _artistRepository = artistRepository,
        _routeRepository = routeRepository,
        _routeGeneratorRepository = routeGeneratorRepository,
        _authRepository = authRepository;

  final ArtistRepository _artistRepository;
  final RouteRepository _routeRepository;
  final RouteGeneratorRepository _routeGeneratorRepository;
  final AuthRepository _authRepository;

  @override
  Future<void> call(
    CreateRouteUseCaseParams params,
  ) async {
    final artistsList = await _artistRepository.getArtistsBySpeciality(
      params.selectedSpecialityIds,
    );
    final artistIds = artistsList.map((artist) => artist.id!).toSet();
    final artists = await _routeGeneratorRepository.generateRoute(
      artistIds: artistIds,
      userLocation: params.userLocation,
    );
    final authenticatedUser = await _authRepository.authenticatedUser;
    final data = Route(
      id: authenticatedUser!.id,
      stops: artists.map((artist) {
        return RouteStop(artist: artist);
      }).toList(),
    );
    await _routeRepository.createRoute(data);
  }
}
