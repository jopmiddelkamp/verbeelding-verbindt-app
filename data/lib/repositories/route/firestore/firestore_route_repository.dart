import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:verbeelding_verbindt_core/entities/common/route.dart';
import 'package:verbeelding_verbindt_core/repositories/route_repository.dart';

import '../../../extensions/route_mapper_extensions.dart';
import '../../../models/route.dart';
import '../../../models/route_stop.dart';

class FirestoreRouteRepository implements RouteRepository {
  FirestoreRouteRepository()
      : _routeCollection = FirebaseFirestore.instance.collection('routes');

  final CollectionReference _routeCollection;

  @override
  Future<void> createRoute(
    RouteEntity data,
  ) async {
    await _routeCollection.doc(data.id).set(data.toDataModel().toJson());
  }

  @override
  Stream<RouteEntity?> getRoute(
    String id,
  ) async* {
    yield* _routeCollection.doc(id).snapshots().map((snapshot) {
      if (!snapshot.exists) {
        return null;
      }
      return RouteDataModel.fromFirebaseMap(
        snapshot.id,
        snapshot.data()!,
      ).toEntity();
    });
  }

  @override
  Future<void> completeRouteStop({
    required String routeId,
    required int stopIndex,
  }) async {
    final snapshot = await _routeCollection.doc(routeId).get();
    final route = RouteDataModel.fromFirebaseMap(
      snapshot.id,
      snapshot.data()!,
    );
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
    await _routeCollection.doc(routeId).set(updatedRoute.toJson());
  }

  MapEntry<int, RouteStopDataModel> _completeMap({
    required int indexToComplete,
    required int index,
    required RouteStopDataModel routeStop,
  }) {
    return MapEntry(
      index,
      routeStop.copyWith(
        completed: index == indexToComplete ? true : routeStop.completed,
      ),
    );
  }
}
