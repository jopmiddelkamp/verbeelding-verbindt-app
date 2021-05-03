import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:verbeelding_verbindt_core/repositories/artist_repository.dart';
import 'package:verbeelding_verbindt_core/repositories/route_generator_repository.dart';
import 'package:verbeelding_verbindt_core/repositories/route_repository.dart';
import 'package:verbeelding_verbindt_core/repositories/speciality_repository.dart';

import 'repositories/artist/firestore/firestore_artist_repository.dart';
import 'repositories/route/firestore/firestore_route_repository.dart';
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
      )
      ..registerSingletonAsync<RouteRepository>(
        () async => FirestoreRouteRepository(),
      )
      ..registerSingletonAsync<SpecialityRepository>(
        () async => FirestoreSpecialityRepository(),
      )
      ..registerSingletonAsync<RouteGeneratorRepository>(
        () async => RouteXlRouteGeneratorRepository(
          http: Dio(), // Need custom
          baseUrl: routeXlBaseUrl,
          username: routeXlUsername,
          password: routeXlPassword,
        ),
      );
  }
}
