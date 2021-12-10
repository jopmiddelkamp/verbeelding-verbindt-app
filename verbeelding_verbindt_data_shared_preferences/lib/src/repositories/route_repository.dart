import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../verbeelding_verbindt_data_shared_preferences.dart';

class RouteRepositoryImpl implements RouteRepository {
  RouteRepositoryImpl({
    required SharedPreferences sharedPreferences,
  }) : _prefs = sharedPreferences;

  final SharedPreferences _prefs;

  final _routeStreamController =
      StreamController<RouteGeoLocation?>.broadcast();

  String _getRouteKey(String id) => 'route_$id';

  @override
  Future<void> createRoute(
    RouteGeoLocation data,
  ) async {
    await _prefs.setString(
      _getRouteKey(data.id!),
      jsonEncode(data.toDataModel().toJson()),
    );
    _routeStreamController.add(data);
  }

  @override
  Stream<RouteGeoLocation?> getRouteStream(
    String id,
  ) async* {
    final stringValue = _prefs.getString(
      _getRouteKey(id),
    );
    if (stringValue == null) {
      _routeStreamController.add(null);
      yield null;
    } else {
      final value =
          RouteDataModel.fromJson(jsonDecode(stringValue)).toGeoLocation();
      _routeStreamController.add(value);
      yield value;
    }
    yield* _routeStreamController.stream;
  }

  @override
  Future<RouteGeoLocation?> getRoute(
    String id,
  ) async {
    final stringValue = _prefs.getString(
      _getRouteKey(id),
    );
    if (stringValue == null) {
      return null;
    }
    final value =
        RouteDataModel.fromJson(jsonDecode(stringValue)).toGeoLocation();
    return value;
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

  MapEntry<int, RouteStopGeoLocation> _completeMap({
    required int indexToComplete,
    required int index,
    required RouteStopGeoLocation routeStop,
  }) {
    return MapEntry(
      index,
      routeStop.copyWith(
        completed: index == indexToComplete ? true : routeStop.completed,
      ),
    );
  }

  @override
  void dispose() {
    _routeStreamController.close();
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
