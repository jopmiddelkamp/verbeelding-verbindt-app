import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';
import 'package:verbeelding_verbindt_data/verbeelding_verbindt_data.dart';

import '../../verbeelding_verbindt_data_route_xl.dart';

extension TourResponseX on TourResponseModel {
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
