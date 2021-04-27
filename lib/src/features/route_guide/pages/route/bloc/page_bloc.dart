import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../common/enums/permission_enum.dart';
import '../../../../../common/enums/permission_status_enum.dart';
import '../../../../../common/extensions/artist_model_list_extensions.dart';
import '../../../../../common/failures/permission/permission_failure.dart';
import '../../../../../common/services/location/location_service.dart';
import '../../../../../common/services/permission/permission_service.dart';
import '../../../services/artist_service.dart';
import '../../../services/route_service.dart';
import 'barrel.dart';

final gl = GeolocatorPlatform.instance;

class PageBloc extends Cubit<PageState> {
  PageBloc.createRoute({
    required ArtistService artistService,
    required PermissionService permissionService,
    required RouteService routeService,
    required LocationService locationService,
    required List<String> selectedSpecialityIds,
  })   : _artistService = artistService,
        _permissionService = permissionService,
        _routeService = routeService,
        _locationService = locationService,
        super(PageState.initialize()) {
    _createRoute(
      selectedSpecialityIds: selectedSpecialityIds,
    );
  }

  PageBloc.openRoute({
    required ArtistService artistService,
    required PermissionService permissionService,
    required RouteService routeService,
    required LocationService locationService,
  })   : _artistService = artistService,
        _permissionService = permissionService,
        _routeService = routeService,
        _locationService = locationService,
        super(PageState.initialize()) {
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
            emit(PageState.load(
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
    final location = await _locationService.getCurrentLocation();
    artists.sortByDistance(location);

    await _routeStreamSub?.cancel();
    await _routeService.createRoute(
      artists: artists.toSet(),
      artistToStartAt: artists.first,
    );
    await _openRoute();
  }

  void qrScanned(
    String value,
  ) {
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
