import 'dart:async';

import '../../../verbeelding_verbindt_core.dart';

class CreateRouteUseCaseArguments {
  CreateRouteUseCaseArguments({
    required this.selectedSpecialityIds,
    required this.userLocation,
  });

  final List<String> selectedSpecialityIds;
  final GeoLocation userLocation;
}

class CreateRouteUseCase extends UseCase<void, CreateRouteUseCaseArguments> {
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
    CreateRouteUseCaseArguments argument,
  ) async {
    final artistsList = await _artistRepository.getArtistsBySpeciality(
      argument.selectedSpecialityIds,
    );
    _sortArtitstByDistance(
      artistsList,
      sourceLocation: argument.userLocation,
    );
    final artists = artistsList.toSet();

    final stops = await _routeGeneratorRepository.generateRouteStops(
      artistToStartAt: artists.first,
      artistsToVisit: artists,
    );
    final authenticatedUser = await _authRepository.authenticatedUser;
    final data = RouteGeoLocation(
      id: authenticatedUser!.id,
      stops: stops,
    );
    await _routeRepository.createRoute(data);
  }

  void _sortArtitstByDistance(
    List<ArtistGeoLocation> artists, {
    required GeoLocation sourceLocation,
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
