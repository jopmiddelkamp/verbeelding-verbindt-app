import 'dart:async';
import 'dart:convert';

import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';
import 'package:verbeelding_verbindt_data/verbeelding_verbindt_data.dart';

class RouteRepositoryImpl extends RepositoryBase implements RouteRepository {
  RouteRepositoryImpl({
    required RxSharedPreferences sharedPreferences,
  }) : _prefs = sharedPreferences;

  final RxSharedPreferences _prefs;

  String _getRouteKey(String id) => 'route_$id';

  @override
  Future<void> createRoute(
    Route data,
  ) {
    final routeKey = _getRouteKey(data.id!);
    final encodedData = jsonEncode(data.toDataModel().toJson());
    return _prefs.setString(
      routeKey,
      encodedData,
    );
  }

  @override
  Stream<Route?> getRouteStream(
    String id,
  ) {
    final routeKey = _getRouteKey(id);
    return _prefs.getStringStream(routeKey).map(_mapGetRoute);
  }

  @override
  Future<Route?> getRoute(
    String id,
  ) async {
    final routeKey = _getRouteKey(id);
    final stringValue = await _prefs.getString(routeKey);
    return _mapGetRoute(stringValue);
  }

  Route? _mapGetRoute(
    String? stringValue,
  ) {
    if (stringValue == null) {
      return null;
    }
    return RouteDataModel.fromJson(jsonDecode(stringValue)).toEntity();
  }

  @override
  Future<void> completeRouteStop({
    required String routeId,
    required int stopIndex,
  }) async {
    var route = await getRouteStream(routeId).first;
    if (route == null) {
      // TODO: throw  a failure
      return;
    }
    final updatedRoute = route.copyWith(
      stops: route.stops
          .asMap()
          .map((index, routeStop) {
            return _completeMap(
              indexToComplete: stopIndex,
              index: index,
              routeStop: routeStop,
            );
          })
          .values
          .toList(),
    );
    await createRoute(updatedRoute);
  }

  MapEntry<int, RouteStop> _completeMap({
    required int indexToComplete,
    required int index,
    required RouteStop routeStop,
  }) {
    return MapEntry(
      index,
      routeStop.copyWith(
        completed: index == indexToComplete ? true : routeStop.completed,
      ),
    );
  }

  @override
  Future<bool> routeExists(
    String id,
  ) async {
    return _prefs.containsKey(
      _getRouteKey(id),
    );
  }

  @override
  Future<void> delete(
    String id,
  ) async {
    await _prefs.remove(
      _getRouteKey(id),
    );
  }
}
