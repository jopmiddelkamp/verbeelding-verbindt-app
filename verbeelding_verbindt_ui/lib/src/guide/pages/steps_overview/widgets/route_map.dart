import 'dart:ui' as ui;

import 'package:flutter/material.dart' hide Size;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../../../verbeelding_verbindt_ui.dart';

class StepsOverviewPageRouteMap extends HookWidget {
  const StepsOverviewPageRouteMap({
    Key? key,
    required this.width,
    required this.height,
    required this.stops,
    required this.currentStop,
    required this.initialMapLocation,
  }) : super(key: key);

  final double width;
  final double height;
  final List<RouteStop> stops;
  final RouteStop currentStop;
  final Geolocation initialMapLocation;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey.shade100,
      child: FutureBuilder<Marker>(
        future: _buildMarker(
          context,
          artist: currentStop.artist,
        ),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: VVCircleLoadingIndicator(
                size: 35,
                text: context.l10n.pageStepsOverviewBusyLoadingMap,
              ),
            );
          }
          final marker = snapshot.data!;
          return _buildGoogleMap(
            context,
            {marker},
          );
        },
      ),
    );
  }

  Widget _buildGoogleMap(
    BuildContext context,
    Set<Marker> markers,
  ) {
    return GoogleMap(
      myLocationEnabled: true,
      compassEnabled: false,
      mapType: MapType.satellite,
      trafficEnabled: false,
      initialCameraPosition: Package.settings.getGoogleMapsCameraPosition(
        initialMapLocation.toLatLng(),
      ),
      markers: markers,
      mapToolbarEnabled: false,
    );
  }

  Future<Marker> _buildMarker(
    BuildContext context, {
    required Artist artist,
  }) async {
    const size = ui.Size(200, 200);
    final shadowColor = context.theme.colorScheme.primary;
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
    required Artist artist,
  }) {
    if (!artist.profile.hasPersonalImage) {
      return ImageUtils.getUiImageFromAsset(
        Asset.unknownArtist.path,
      );
    }
    return ImageUtils.getUiImageFromUrl(
      artist.profile.personalImage!,
    );
  }
}
