import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../common/extensions/build_context_extensions.dart';
import '../../../../../common/extensions/location_extensions.dart';
import '../../../../../common/models/location_model.dart';
import '../../../../../common/utils/image_utils.dart';
import '../../../../../common/utils/marker_utils.dart';
import '../../../../../common/widgets/loading_indicators/circle_loading_indicator.dart';
import '../../../../../constants.dart';
import '../../../models/artist_model.dart';
import '../../../models/route_stop_model.dart';
import '../bloc/barrel.dart';

class RouteMap extends StatelessWidget {
  const RouteMap({
    Key? key,
    required this.width,
    required this.height,
    required this.stops,
    required this.currentStop,
    required this.initialMapLocation,
  }) : super(key: key);

  final double width;
  final double height;
  final List<RouteStopModel> stops;
  final RouteStopModel currentStop;
  final LocationModel initialMapLocation;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey.shade100,
      child: FutureBuilder<Set<Marker>>(
          future: _generateMarkers(
            context,
            stops: stops,
            currentStop: currentStop,
          ),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: VVCircleLoadingIndicator(),
              );
            }
            return _buildGoogleMap(
              context,
              snapshot.data!,
            );
          }),
    );
  }

  Future<Set<Marker>> _generateMarkers(
    BuildContext context, {
    required List<RouteStopModel> stops,
    required RouteStopModel currentStop,
  }) async {
    final markers = await Future.wait(stops.map(
      (e) => _buildMarker(
        context,
        artist: e.artist,
        current: e.artist == currentStop.artist,
      ),
    ));
    return markers.toSet();
  }

  Widget _buildGoogleMap(
    BuildContext context,
    Set<Marker> markers,
  ) {
    return GoogleMap(
      myLocationEnabled: true,
      compassEnabled: true,
      initialCameraPosition:
          Application.defaultSettings.getGoogleMapsCameraPosition(
        initialMapLocation.toLatLng(),
      ),
      onMapCreated: (controller) {
        context.blocProvider<PageBloc>().setMapController(controller);
      },
      markers: markers,
    );
  }

  Future<Marker> _buildMarker(
    BuildContext context, {
    required ArtistModel artist,
    required bool current,
  }) async {
    final size = const Size(200, 200);
    final shadowColor = current
        ? context.theme.colorScheme.primary
        : context.theme.colorScheme.secondary;
    return Marker(
      markerId: MarkerId(artist.id ?? artist.profile.fullName),
      // TODO: Abstract markers solution
      icon: await MarkerUtils.getMarkerIcon(
        imageResolver: () => _resolveMarkerIconUiImage(
          artist: artist,
        ),
        size: size,
        shadowColor: shadowColor,
      ),
      position: artist.location.toLatLng(),
    );
  }

  Future<ui.Image> _resolveMarkerIconUiImage({
    required ArtistModel artist,
  }) {
    if (!artist.profile.hasPersonalImage) {
      return ImageUtils.getUiImageFromAsset(
        Application.defaultSettings.artistFallbackImagePath,
      );
    }
    return ImageUtils.getUiImageFromUrl(
      artist.profile.personalImage!,
    );
  }
}
