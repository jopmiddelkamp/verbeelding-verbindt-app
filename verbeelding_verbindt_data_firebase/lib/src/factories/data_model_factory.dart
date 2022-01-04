import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:verbeelding_verbindt_data/verbeelding_verbindt_data.dart';

abstract class DataModelFactory {
  ArtistDataModel createArtistDataModel({
    String? id,
    required Map<String, dynamic> map,
  });

  RouteStopDataModel createRouteStopDataModel(
    Map<String, dynamic> map,
  );

  RouteDataModel createRouteDataModel(
    String id,
    Map<String, dynamic> map,
  );
}

class DataModelFactoryImpl implements DataModelFactory {
  const DataModelFactoryImpl();

  @override
  ArtistDataModel createArtistDataModel({
    String? id,
    required Map<String, dynamic> map,
  }) {
    final specialities = <String, SpecialityDataModel>{};
    (map['specialities'] as Map).forEach((key, value) {
      final specialityMap = value as Map;
      final speciality = SpecialityDataModel.fromFirebaseMap(
        key,
        specialityMap as Map<String, dynamic>,
      );
      specialities[key] = speciality;
    });

    final geoPoint = map['location'] as GeoPoint;
    return ArtistDataModel(
      id: id,
      profile: ProfileDataModel.fromJson(
        map['profile'],
      ),
      specialities: specialities,
      location: GeolocationDataModel.fromJson({
        '_latitude': geoPoint.latitude,
        '_longitude': geoPoint.longitude,
      }),
      previewContent: ArtistRoutePreviewDataModel.fromJson(
        map['previewContent'],
      ),
      detailsContent: ArtistRouteDetailsDataModel.fromJson(
        map['detailsContent'],
      ),
      website: map['website'],
    );
  }

  @override
  RouteStopDataModel createRouteStopDataModel(
    Map<String, dynamic> map,
  ) {
    final artistId = map['artist']['id'] ?? map['artistId'];
    return RouteStopDataModel(
      artist: createArtistDataModel(
        id: artistId as String,
        map: map['artist'],
      ),
      completed: map['completed'],
    );
  }

  @override
  RouteDataModel createRouteDataModel(
    String id,
    Map<String, dynamic> map,
  ) {
    return RouteDataModel(
      id: id,
      stops: _mapStops(map['stops']),
    );
  }

  List<RouteStopDataModel> _mapStops(
    List stops,
  ) {
    return stops.map((value) {
      if (value is Map<String, dynamic>) {
        return createRouteStopDataModel(value);
      }
      throw Exception('$RouteDataModel._mapStops: unsupported value provided.');
    }).toList();
  }
}
