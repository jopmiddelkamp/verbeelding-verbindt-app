import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:verbeelding_verbindt_core/entities/page_content/intro_page_content.dart';
import 'package:verbeelding_verbindt_core/repositories/page_content_repository.dart';

import '../../../extensions/intro_page_content_mapper_extension.dart';
import '../../../models/intro_page_content.dart';

class FirestorePageContentRepository implements PageContentRepository {
  FirestorePageContentRepository()
      : _collection = FirebaseFirestore.instance.collection('pageData');

  final CollectionReference _collection;

  @override
  Stream<IntroPageContentEntity> getIntroPageContent() {
    return _collection.doc('intro').snapshots().map((snapshot) {
      return IntroPageContentDataModel.fromJson(
        snapshot.data()!,
      ).toEntity();
    });
  }
}
