import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:verbeelding_verbindt_core/entities/page_content/intro_page_content.dart';
import 'package:verbeelding_verbindt_core/entities/page_content/route_completed_page_content.dart';
import 'package:verbeelding_verbindt_core/repositories/page_content_repository.dart';

import '../../../extensions/intro_page_content_mapper_extension.dart';
import '../../../extensions/route_completed_page_content_mapper_extension.dart';
import '../../../models/intro_page_content.dart';
import '../../../models/route_completed_page_content.dart';

class FirestorePageContentRepository implements PageContentRepository {
  FirestorePageContentRepository({
    FirebaseFirestore? firestore,
  }) : _collection =
            (firestore ?? FirebaseFirestore.instance).collection('pageData');

  final CollectionReference _collection;

  @override
  Stream<IntroPageContentEntity?> getIntroPageContent() {
    return getPageContent<IntroPageContentEntity, IntroPageContentDataModel>(
      'intro',
      fromFirestore: (snapshot, _) {
        return IntroPageContentDataModel.fromJson(
          snapshot.data()!,
        );
      },
      toFirestore: (value, _) {
        return value.toJson();
      },
      map: (snapshot) {
        return snapshot.data()?.toEntity();
      },
    );
  }

  @override
  Stream<RouteCompletedPageContentEntity?> getRouteCompletedPageContent() {
    return getPageContent<RouteCompletedPageContentEntity,
        RouteCompletedPageContentDataModel>(
      'routeCompleted',
      fromFirestore: (snapshot, _) {
        return RouteCompletedPageContentDataModel.fromJson(
          snapshot.data()!,
        );
      },
      toFirestore: (value, _) {
        return value.toJson();
      },
      map: (snapshot) {
        return snapshot.data()?.toEntity();
      },
    );
  }

  Stream<TEntity?> getPageContent<TEntity, TDataModel>(
    String id, {
    required FromFirestore<TDataModel> fromFirestore,
    required ToFirestore<TDataModel> toFirestore,
    required TEntity? Function(DocumentSnapshot<TDataModel> snapshot) map,
  }) {
    return _collection
        .withConverter<TDataModel>(
          fromFirestore: fromFirestore,
          toFirestore: toFirestore,
        )
        .doc(id)
        .snapshots()
        .map(map);
  }
}
