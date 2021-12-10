import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../verbeelding_verbindt_data_dio.dart';

class RouteXlRouteGeneratorRepository extends DioRepositoryBase
    implements RouteGeneratorRepository {
  RouteXlRouteGeneratorRepository({
    required Dio http,
    required String baseUrl,
    required String username,
    required String password,
  }) : super(
          http: http,
          baseUrl: baseUrl,
        ) {
    http.interceptors.insert(
      0,
      RxAuthInterceptor(
        username: username,
        password: password,
      ),
    );
  }

  @override
  Future<List<RouteStopGeoLocation>> generateRouteStops({
    required final ArtistGeoLocation artistToStartAt,
    required final Set<ArtistGeoLocation> artistsToVisit,
  }) async {
    final requestUrl = getApiUrl('/tour');
    final requestBody = _getTourRequestModel(
      artistsToVisit: artistsToVisit,
      artistToStartAt: artistToStartAt,
    );
    final resp = await http.post(
      requestUrl,
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
      ),
      data: FormData.fromMap({
        'locations': const JsonEncoder().convert(requestBody.locations),
      }),
    );
    final response = RxTourResponseModel.fromJson(resp.data);
    return response
        .toRouteStopModels(
          artistsToVisit: artistsToVisit.toDataModelSet(),
        )
        .toGeoLocationList();
  }

  RxTourRequestModel _getTourRequestModel({
    required Set<ArtistGeoLocation> artistsToVisit,
    required ArtistGeoLocation artistToStartAt,
  }) {
    final artists = _getArtistsListForRouteGeneration(
      artistsToVisit: artistsToVisit,
      artistToStartAt: artistToStartAt,
    );
    final locations = artists
        .asMap()
        .map<int, RxLocationModel>((i, e) {
          final isLast = i == artists.length - 1;
          return MapEntry(
            i,
            RxLocationModel(
              name: isLast ? 'The last location' : e.profile.fullName,
              lat: e.location.latitude,
              lng: e.location.latitude,
            ),
          );
        })
        .values
        .toList();
    final data = RxTourRequestModel(
      locations: locations,
    );
    return data;
  }

  List<ArtistGeoLocation> _getArtistsListForRouteGeneration({
    required final Set<ArtistGeoLocation> artistsToVisit,
    required final ArtistGeoLocation artistToStartAt,
  }) {
    return artistsToVisit.toList()
      ..remove(artistToStartAt)
      // First element is start location
      ..insert(0, artistToStartAt)
      // Only take 8 as that is the free API limit
      ..take(8).toList()
      // Last element is finish location
      ..add(artistToStartAt);
  }
}
