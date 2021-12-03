import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:verbeelding_verbindt_core/entities/artist.dart';
import 'package:verbeelding_verbindt_core/entities/route_stop.dart';
import 'package:verbeelding_verbindt_core/repositories/route_generator_repository.dart';

import '../../../extensions/artist_mapper_extensions.dart';
import '../../../extensions/route_stop_mapper_extensions.dart';
import '../../dio_repository_base.dart';
import 'extensions/rx_tour_response_extensions.dart';
import 'interceptors/rx_auth_interceptor.dart';
import 'models/rx_location_model.dart';
import 'models/rx_tour_request_model.dart';
import 'models/rx_tour_response_model.dart';

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
  Future<List<RouteStopEntity>> generateRouteStops({
    required final ArtistEntity artistToStartAt,
    required final Set<ArtistEntity> artistsToVisit,
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
        .toEntityList();
  }

  RxTourRequestModel _getTourRequestModel({
    required Set<ArtistEntity> artistsToVisit,
    required ArtistEntity artistToStartAt,
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

  List<ArtistEntity> _getArtistsListForRouteGeneration({
    required final Set<ArtistEntity> artistsToVisit,
    required final ArtistEntity artistToStartAt,
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
