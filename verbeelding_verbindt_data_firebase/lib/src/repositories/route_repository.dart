import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../verbeelding_verbindt_data_firebase.dart';

class RouteRepositoryImpl extends RouteRepository {
  RouteRepositoryImpl({
    required FirebaseFirestore firestore,
  }) : _routeCollection =
            firestore.collection('routes').withConverter<RouteDataModel>(
          fromFirestore: (snapshot, _) {
            return RouteDataModel.fromFirebaseMap(
              snapshot.id,
              snapshot.data()!,
            );
          },
          toFirestore: (value, _) {
            return value.toJson();
          },
        );

  final CollectionReference<RouteDataModel> _routeCollection;

  @override
  Future<void> createRoute(
    RouteGeoLocation data,
  ) async {
    await _routeCollection.doc(data.id).set(data.toDataModel());
  }

  @override
  Stream<RouteGeoLocation?> getRouteStream(
    String id,
  ) async* {
    yield* _routeCollection.doc(id).snapshots().map((snapshot) {
      return snapshot.data()?.toGeoLocation();
    });
  }

  @override
  Future<RouteGeoLocation?> getRoute(
    String id,
  ) async {
    final docSnap = await _routeCollection.doc(id).get();
    return docSnap.data()?.toGeoLocation();
  }

  @override
  Future<void> completeRouteStop({
    required String routeId,
    required int stopIndex,
  }) async {
    final snapshot = await _routeCollection.doc(routeId).get();
    if (!snapshot.exists) {
      return;
    }
    final route = snapshot.data()!.copyWith(
          id: snapshot.id,
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
    await _routeCollection.doc(routeId).set(updatedRoute);
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

  @override
  Future<bool> routeExists(
    String id,
  ) async {
    final snapshot = await _routeCollection.doc(id).get();
    return snapshot.exists;
  }

  @override
  Future<void> delete(
    String id,
  ) async {
    await _routeCollection.doc(id).delete();
  }
}
