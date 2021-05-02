import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:verbeelding_verbindt_core/entities/artist.dart';
import 'package:verbeelding_verbindt_core/entities/location.dart';
import 'package:verbeelding_verbindt_core/enums/permission_enum.dart';
import 'package:verbeelding_verbindt_core/enums/permission_status_enum.dart';
import 'package:verbeelding_verbindt_core/failures/permission/permission_failure.dart';
import 'package:verbeelding_verbindt_core/services/artist_service.dart';
import 'package:verbeelding_verbindt_core/services/location_service.dart';
import 'package:verbeelding_verbindt_core/services/permission_service.dart';
import 'package:verbeelding_verbindt_core/services/route_service.dart';

import 'guide_state.dart';

class GuideCubit extends Cubit<GuideState> {
  GuideCubit.createRoute({
    required ArtistService artistService,
    required PermissionService permissionService,
    required RouteService routeService,
    required LocationService locationService,
    required List<String> selectedSpecialityIds,
  })   : _artistService = artistService,
        _permissionService = permissionService,
        _routeService = routeService,
        _locationService = locationService,
        super(GuideState.initialize()) {
    _createRoute(
      selectedSpecialityIds: selectedSpecialityIds,
    );
  }

  GuideCubit.openRoute({
    required ArtistService artistService,
    required PermissionService permissionService,
    required RouteService routeService,
    required LocationService locationService,
  })   : _artistService = artistService,
        _permissionService = permissionService,
        _routeService = routeService,
        _locationService = locationService,
        super(GuideState.initialize()) {
    _openRoute();
  }

  final ArtistService _artistService;
  final PermissionService _permissionService;
  final RouteService _routeService;
  final LocationService _locationService;

  StreamSubscription? _routeStreamSub;

  Future<void> _openRoute() async {
    // TODO: add retry mechanism
    try {
      await _permissionService.requestIfNeeded(
        Permission.location,
      );
      final lastPos = await _locationService.getLastKnownLocation();
      if (lastPos != null) {
        await _routeStreamSub?.cancel();
        _routeStreamSub = _routeService.getRoute().listen((route) {
          if (route == null) {
            // TODO: handle situation
            return;
          }
          if (!state.stopsLoaded) {
            emit(GuideState.load(
              stops: route.stops,
              initialMapLocation: lastPos,
            ));
          } else {
            emit(state.copyWith(
              stops: route.stops,
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
    final artists = await _artistService.getArtistsBySpeciality(
      selectedSpecialityIds,
    );
    final location = await _locationService.getCurrentLocation(
      locationAccuracy: LocationAccuracy.medium,
    );
    _sortArtitstByDistance(
      artists,
      sourceLocation: location,
    );

    await _routeService.createRoute(
      artists: artists.toSet(),
      artistToStartAt: artists.first,
    );
    await _openRoute();
  }

  void _sortArtitstByDistance(
    List<ArtistEntity> artists, {
    required LocationEntity sourceLocation,
  }) {
    artists.sort((a, b) {
      final distanceToA = _locationService.distanceBetween(
        sourceLocation,
        a.location,
      );
      final distanceToB = _locationService.distanceBetween(
        sourceLocation,
        b.location,
      );
      return distanceToA.compareTo(distanceToB); // Sort by closest
    });
  }

  void next() {
    throw UnimplementedError();
  }

  void setMapController(
    GoogleMapController mapController,
  ) {
    emit(state.copyWith(
      mapController: mapController,
    ));
  }

  @override
  Future<void> close() async {
    await _routeStreamSub?.cancel();
    return super.close();
  }
}
