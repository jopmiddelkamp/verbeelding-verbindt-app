import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';
import 'package:verbeelding_verbindt_data/verbeelding_verbindt_data.dart';
import 'package:verbeelding_verbindt_data_http/verbeelding_verbindt_data_http.dart';

import '../../../../verbeelding_verbindt_data_route_xl.dart';

class RouteXlRouteGeneratorRepository extends HttpRepositoryBase
    implements RouteGeneratorRepository {
  RouteXlRouteGeneratorRepository({
    required Dio http,
    required String baseUrl,
    required String username,
    required String password,
  }) : super(
          http: http,
          baseUrl: baseUrl,
          interceptors: [
            AuthInterceptor(
              username: username,
              password: password,
            ),
          ],
        );

  @override
  Future<List<RouteStop>> generateRouteStops({
    required final Artist artistToStartAt,
    required final Set<Artist> artistsToVisit,
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
    final response = TourResponseModel.fromJson(resp.data);
    return response
        .toRouteStopModels(
          artistsToVisit: artistsToVisit.toDataModelSet(),
        )
        .toEntityList();
  }

  TourRequestModel _getTourRequestModel({
    required Set<Artist> artistsToVisit,
    required Artist artistToStartAt,
  }) {
    final artists = _getArtistsListForRouteGeneration(
      artistsToVisit: artistsToVisit,
      artistToStartAt: artistToStartAt,
    );
    final locations = artists
        .asMap()
        .map<int, LocationModel>((i, e) {
          final isLast = i == artists.length - 1;
          return MapEntry(
            i,
            LocationModel(
              name: isLast ? 'The last location' : e.profile.fullName,
              lat: e.location.latitude,
              lng: e.location.latitude,
            ),
          );
        })
        .values
        .toList();
    final data = TourRequestModel(
      locations: locations,
    );
    return data;
  }

  List<Artist> _getArtistsListForRouteGeneration({
    required final Set<Artist> artistsToVisit,
    required final Artist artistToStartAt,
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
