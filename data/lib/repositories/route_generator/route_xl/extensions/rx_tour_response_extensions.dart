import 'package:verbeelding_verbindt_core/extensions/iterable_extensions.dart';

import '../../../../models/artist.dart';
import '../../../../models/route_stop.dart';
import '../models/rx_tour_response_model.dart';

extension RxTourResponseExtensions on RxTourResponseModel {
  List<RouteStopDataModel> toRouteStopModels({
    required final Set<ArtistDataModel> artistsToVisit,
  }) {
    // Skip the last as it's the same as the first
    final routeSteps = route.values.skipLast();
    final artistLookup = artistsToVisit.toLookupMap(
      (e) => e.profile.fullName,
    );
    final artists =
        routeSteps.map<ArtistDataModel>((e) => artistLookup[e.name]!);
    return _getRouteStopModels(
      artists: artists,
    );
  }

  List<RouteStopDataModel> _getRouteStopModels({
    required Iterable<ArtistDataModel> artists,
  }) {
    return artists.map<RouteStopDataModel>((e) {
      return RouteStopDataModel(artist: e);
    }).toList();
  }
}
