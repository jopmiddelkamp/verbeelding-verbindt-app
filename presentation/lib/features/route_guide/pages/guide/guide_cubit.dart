import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:verbeelding_verbindt_core/entities/common/artist.dart';
import 'package:verbeelding_verbindt_core/entities/common/device_info.dart';
import 'package:verbeelding_verbindt_core/entities/common/location.dart';
import 'package:verbeelding_verbindt_core/entities/common/route.dart';
import 'package:verbeelding_verbindt_core/repositories/artist_repository.dart';
import 'package:verbeelding_verbindt_core/repositories/route_generator_repository.dart';
import 'package:verbeelding_verbindt_core/repositories/route_repository.dart';
import 'package:verbeelding_verbindt_core/utils/location_utils.dart';

import '../../../../shared/bloc/cubit_base.dart';
import '../../../../shared/enums/permission_enum.dart';
import '../../../../shared/enums/permission_status_enum.dart';
import '../../../../shared/failures/permission/permission_failure.dart';
import '../../../../shared/services/location/location_service.dart';
import '../../../../shared/services/permission/permission_service.dart';
import 'guide_state.dart';

class GuideCubit extends CubitBase<GuideState> {
  GuideCubit.createRoute({
    required DeviceInfoEntity deviceInfo,
    required ArtistRepository artistRepository,
    required PermissionService permissionService,
    required RouteRepository routeRepository,
    required RouteGeneratorRepository routeGeneratorRepository,
    required LocationService locationService,
    required List<String> selectedSpecialityIds,
  })   : _deviceInfo = deviceInfo,
        _artistRepository = artistRepository,
        _permissionService = permissionService,
        _routeRepository = routeRepository,
        _routeGeneratorRepository = routeGeneratorRepository,
        _locationService = locationService,
        super(GuideState.initialize()) {
    _createRoute(
      selectedSpecialityIds: selectedSpecialityIds,
    );
  }

  GuideCubit.openRoute({
    required DeviceInfoEntity deviceInfo,
    required ArtistRepository artistRepository,
    required PermissionService permissionService,
    required RouteRepository routeRepository,
    required RouteGeneratorRepository routeGeneratorRepository,
    required LocationService locationService,
  })   : _deviceInfo = deviceInfo,
        _artistRepository = artistRepository,
        _permissionService = permissionService,
        _routeRepository = routeRepository,
        _routeGeneratorRepository = routeGeneratorRepository,
        _locationService = locationService,
        super(GuideState.initialize()) {
    _openRoute();
  }

  final DeviceInfoEntity _deviceInfo;
  final ArtistRepository _artistRepository;
  final PermissionService _permissionService;
  final RouteRepository _routeRepository;
  final RouteGeneratorRepository _routeGeneratorRepository;
  final LocationService _locationService;

  Future<void> _openRoute() async {
    // TODO: add retry mechanism
    try {
      await _permissionService.requestIfNeeded(
        Permission.location,
      );
      final lastPos = await _locationService.getLastKnownLocation();
      if (lastPos != null) {
        _routeRepository
            .getRoute(_deviceInfo.id)
            .takeUntil(dispose$)
            .listen((route) {
          if (route == null) {
            // TODO: handle situation
            return;
          }
          if (!state.routeLoaded) {
            emit(GuideState.load(
              route: route,
              initialMapLocation: lastPos,
            ));
          } else {
            emit(state.copyWith(
              route: route,
            ));
          }
        });
      }
    } on PermissionFailure catch (failure) {
      emit(state.copyWith(
        failure: failure,
      ));
    }
  }

  Future<void> _createRoute({
    required final List<String> selectedSpecialityIds,
  }) async {
    final permissionResult = await _permissionService.requestIfNeeded(
      Permission.location,
    );
    if (permissionResult.newStatus != PermissionStatus.granted) {
      // TODO add solution
      return;
    }

    final location = await _locationService.getCurrentLocation(
      locationAccuracy: LocationAccuracy.medium,
    );

    final artistsList = await _artistRepository.getArtistsBySpeciality(
      selectedSpecialityIds,
    );
    _sortArtitstByDistance(
      artistsList,
      sourceLocation: location,
    );
    final artists = artistsList.toSet();

    final stops = await _routeGeneratorRepository.generateRouteStops(
      artistToStartAt: artists.first,
      artistsToVisit: artists,
    );
    final data = RouteEntity(
      id: _deviceInfo.id,
      stops: stops,
    );
    await _routeRepository.createRoute(data);
    await _openRoute();
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

  Future<void> next() async {
    if (!state.hasCurrentStop) {
      return;
    }
    await _routeRepository.completeRouteStop(
      routeId: state.route!.id!,
      stopIndex: state.currentStopIndex!,
    );
  }

  void setMapController(
    GoogleMapController mapController,
  ) {
    emit(state.copyWith(
      mapController: mapController,
    ));
  }
}
