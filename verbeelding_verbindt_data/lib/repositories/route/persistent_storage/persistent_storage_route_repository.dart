import 'dart:async';
import 'dart:convert';

import 'package:verbeelding_verbindt_core/entities/route.dart';
import 'package:verbeelding_verbindt_core/entities/route_stop.dart';
import 'package:verbeelding_verbindt_core/repositories/route_repository.dart';

import '../../../extensions/route_mapper_extensions.dart';
import '../../../models/route.dart';
import '../../persistent_storage/persistent_storage_repository.dart';

class PersistentStorageRouteRepository implements RouteRepository {
  PersistentStorageRouteRepository({
    required PersistentStorageRepository persistentStorageRepository,
  }) : _persistentStorageRepository = persistentStorageRepository;

  final PersistentStorageRepository _persistentStorageRepository;

  final _routeStreamController = StreamController<RouteEntity?>.broadcast();

  String _getRouteKey(String id) => 'route_$id';

  @override
  Future<void> createRoute(
    RouteEntity data,
  ) async {
    await _persistentStorageRepository.setString(
      _getRouteKey(data.id!),
      jsonEncode(data.toDataModel().toJson()),
    );
    _routeStreamController.add(data);
  }

  @override
  Stream<RouteEntity?> getRouteStream(
    String id,
  ) async* {
    final stringValue = await _persistentStorageRepository.getString(
      _getRouteKey(id),
    );
    if (stringValue == null) {
      _routeStreamController.add(null);
      yield null;
    } else {
      final value = RouteDataModel.fromJson(jsonDecode(stringValue)).toEntity();
      _routeStreamController.add(value);
      yield value;
    }
    yield* _routeStreamController.stream;
  }

  @override
  Future<RouteEntity?> getRoute(
    String id,
  ) async {
    final stringValue = await _persistentStorageRepository.getString(
      _getRouteKey(id),
    );
    if (stringValue == null) {
      return null;
    }
    final value = RouteDataModel.fromJson(jsonDecode(stringValue)).toEntity();
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

  MapEntry<int, RouteStopEntity> _completeMap({
    required int indexToComplete,
    required int index,
    required RouteStopEntity routeStop,
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
    return await _persistentStorageRepository.containsKey(
      _getRouteKey(id),
    );
  }

  @override
  Future<void> delete(
    String id,
  ) async {
    await _persistentStorageRepository.remove(
      _getRouteKey(id),
    );
  }
}
