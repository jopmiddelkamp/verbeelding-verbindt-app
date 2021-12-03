import 'dart:async';

import '../../../verbeelding_verbindt_core.dart';

class CreateRouteUseCase extends UseCase<void, CreateRouteUseCaseArguments> {
  CreateRouteUseCase({
    required ArtistRepository artistRepository,
    required RouteRepository routeRepository,
    required RouteGeneratorRepository routeGeneratorRepository,
    required AuthRepository authRepository,
    required LocationRepository locationRepository,
  })  : _artistRepository = artistRepository,
        _routeRepository = routeRepository,
        _routeGeneratorRepository = routeGeneratorRepository,
        _authRepository = authRepository,
        _locationRepository = locationRepository;

  final ArtistRepository _artistRepository;
  final RouteRepository _routeRepository;
  final RouteGeneratorRepository _routeGeneratorRepository;
  final AuthRepository _authRepository;
  final LocationRepository _locationRepository;

  @override
  Future<void> call(
    CreateRouteUseCaseArguments argument,
  ) async {
    final artistsList = await _artistRepository.getArtistsBySpeciality(
      argument.selectedSpecialityIds,
    );
    final userLocation = await _locationRepository.getCurrentLocation();
    _sortArtitstByDistance(
      artistsList,
      sourceLocation: userLocation,
    );
    final artists = artistsList.toSet();

    final stops = await _routeGeneratorRepository.generateRouteStops(
      artistToStartAt: artists.first,
      artistsToVisit: artists,
    );
    final authenticatedUser = await _authRepository.authenticatedUser;
    final data = RouteEntity(
      id: authenticatedUser!.id,
      stops: stops,
    );
    await _routeRepository.createRoute(data);
  }

  void _sortArtitstByDistance(
    List<ArtistEntity> artists, {
    required LocationEntity sourceLocation,
  }) {
    artists.sort((a, b) {
      final distanceToA = LocationUtils.distance(
        sourceLocation,
        a.location,
      );
      final distanceToB = LocationUtils.distance(
        sourceLocation,
        b.location,
      );
      return distanceToA.compareTo(distanceToB); // Sort by closest
    });
  }
}

class CreateRouteUseCaseArguments {
  CreateRouteUseCaseArguments({
    required this.selectedSpecialityIds,
  });

  final List<String> selectedSpecialityIds;
}
