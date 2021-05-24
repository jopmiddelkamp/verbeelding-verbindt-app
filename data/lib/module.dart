import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:verbeelding_verbindt_core/repositories/artist_repository.dart';
import 'package:verbeelding_verbindt_core/repositories/auth_repository.dart';
import 'package:verbeelding_verbindt_core/repositories/page_content_repository.dart';
import 'package:verbeelding_verbindt_core/repositories/route_generator_repository.dart';
import 'package:verbeelding_verbindt_core/repositories/route_repository.dart';
import 'package:verbeelding_verbindt_core/repositories/speciality_repository.dart';
import 'package:verbeelding_verbindt_core/services/persistent_storage_service.dart';

import 'repositories/artist/firestore/firestore_artist_repository.dart';
import 'repositories/auth/firebase/firebase_auth_repository.dart';
import 'repositories/page_content/firestore/firestore_page_content_repository.dart';
import 'repositories/route/persistent_storage/persistent_storage_route_repository.dart';
import 'repositories/route_generator/route_xl/route_xl_repository.dart';
import 'repositories/speciality/firestore/firestore_speciality_repository.dart';

final serviceLocator = GetIt.instance;

class Module {
  static Future<void> initialize({
    required String routeXlBaseUrl,
    required String routeXlUsername,
    required String routeXlPassword,
  }) async {
    await Firebase.initializeApp();
    _initRepositories(
      routeXlBaseUrl: routeXlBaseUrl,
      routeXlUsername: routeXlUsername,
      routeXlPassword: routeXlPassword,
    );
  }

  static void _initRepositories({
    required String routeXlBaseUrl,
    required String routeXlUsername,
    required String routeXlPassword,
  }) {
    serviceLocator
      ..registerSingletonAsync<Dio>(
        () async => Dio(),
        dispose: (dio) => dio.close(),
      )
      ..registerSingletonAsync<ArtistRepository>(
        () async => FirestoreArtistRepository(),
        dispose: (param) => param.dispose(),
      )
      ..registerSingletonWithDependencies<RouteRepository>(
        () => PersistentStorageRouteRepository(
          persistentStorageService: serviceLocator(),
        ),
        dependsOn: [
          PersistentStorageService,
        ],
        dispose: (param) => param.dispose(),
      )
      ..registerSingletonAsync<SpecialityRepository>(
        () async => FirestoreSpecialityRepository(),
        dispose: (param) => param.dispose(),
      )
      ..registerSingletonAsync<RouteGeneratorRepository>(
        () async => RouteXlRouteGeneratorRepository(
          http: Dio(), // Need custom
          baseUrl: routeXlBaseUrl,
          username: routeXlUsername,
          password: routeXlPassword,
        ),
        dispose: (param) => param.dispose(),
      )
      ..registerSingletonAsync<PageContentRepository>(
        () async => FirestorePageContentRepository(),
        dispose: (param) => param.dispose(),
      )
      ..registerSingletonAsync<AuthRepository>(
        () async => FirebaseAuthRepository(),
        dispose: (param) => param.dispose(),
      );
  }
}
