import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:verbeelding_verbindt_core/entities/artist.dart';
import 'package:verbeelding_verbindt_core/entities/location.dart';
import 'package:verbeelding_verbindt_core/entities/route_stop.dart';

import '../../../../../constants.dart';
import '../../../../../shared/extensions/build_context_extensions.dart';
import '../../../../../shared/extensions/location_extensions.dart';
import '../../../../../shared/utils/image_utils.dart';
import '../../../../../shared/utils/marker_utils.dart';
import '../../../../../shared/widgets/loading_indicators/circle_loading_indicator.dart';
import '../../../../../theme.sizes.dart';
import '../guide_cubit.dart';

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
  final List<RouteStopEntity> stops;
  final RouteStopEntity currentStop;
  final LocationEntity initialMapLocation;

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
              return const Center(
                child: VVCircleLoadingIndicator(
                  size: 35,
                  label: 'Bezig met het laden van de map..',
                ),
              );
            }
            final marker = snapshot.data!;
            return _buildGoogleMap(
              context,
              {marker},
            );
          }),
    );
  }

  Widget _buildGoogleMap(
    BuildContext context,
    Set<Marker> markers,
  ) {
    return GoogleMap(
      myLocationEnabled: true,
      compassEnabled: false,
      padding: const EdgeInsets.all(kDefaultPadding * 1.5),
      mapType: MapType.satellite,
      initialCameraPosition: kDefaultSettings.getGoogleMapsCameraPosition(
        initialMapLocation.toLatLng(),
      ),
      onMapCreated: (controller) {
        context.blocProvider<GuideCubit>().setMapController(controller);
      },
      markers: markers,
    );
  }

  Future<Marker> _buildMarker(
    BuildContext context, {
    required ArtistEntity artist,
  }) async {
    final size = const Size(200, 200);
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
    required ArtistEntity artist,
  }) {
    if (!artist.profile.hasPersonalImage) {
      return ImageUtils.getUiImageFromAsset(
        kDefaultSettings.artistFallbackImagePath,
      );
    }
    return ImageUtils.getUiImageFromUrl(
      artist.profile.personalImage!,
    );
  }
}
