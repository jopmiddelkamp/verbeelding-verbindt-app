import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../constants.dart';
import '../../../../../../shared/domain/models/extensions/location_extensions.dart';
import '../../../../../../shared/domain/models/location_model.dart';
import '../../../../../../shared/misc/utils/image_utils.dart';
import '../../../../../../shared/misc/utils/marker_utils.dart';
import '../../../../../../shared/presentation/extensions/build_context_extensions.dart';
import '../../../../../../shared/presentation/widgets/loading_indicators/circle_loading_indicator.dart';
import '../../../../domain/models/artist_model.dart';
import '../../../../domain/models/route_stop_model.dart';
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
      child: FutureBuilder<Marker>(
          future: _buildMarker(
            context,
            artist: currentStop.artist,
          ),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: VVCircleLoadingIndicator(),
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
      compassEnabled: true,
      initialCameraPosition: kDefaultSettings.getGoogleMapsCameraPosition(
        initialMapLocation.toLatLng(),
      ),
      onMapCreated: (controller) {
        context.blocProvider<PageBloc>().setMapController(controller);
      },
      markers: markers,
    );
  }

  Future<Marker> _buildMarker(BuildContext context,
      {required ArtistModel artist}) async {
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
    required ArtistModel artist,
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
