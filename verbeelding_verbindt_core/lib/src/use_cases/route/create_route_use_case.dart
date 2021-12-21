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
    _sortArtitstByDistance(
      artistsList,
      sourceLocation: params.userLocation,
    );
    final artists = artistsList.toSet();

    final stops = await _routeGeneratorRepository.generateRouteStops(
      artistToStartAt: artists.first,
      artistsToVisit: artists,
    );
    final authenticatedUser = await _authRepository.authenticatedUser;
    final data = Route(
      id: authenticatedUser!.id,
      stops: stops,
    );
    await _routeRepository.createRoute(data);
  }

  void _sortArtitstByDistance(
    List<Artist> artists, {
    required sourceLocation,
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
