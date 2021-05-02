import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:verbeelding_verbindt_core/entities/route.dart';
import 'package:verbeelding_verbindt_core/repositories/route_repository.dart';

import '../../../extensions/route_mapper_extensions.dart';
import '../../../models/route.dart';

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
      return RouteDataModel.fromMap(
        snapshot.id,
        snapshot.data()!,
      ).toEntity();
    });
  }
}
