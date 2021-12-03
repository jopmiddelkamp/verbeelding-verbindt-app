import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:verbeelding_verbindt_core/aliases.dart';
import 'package:verbeelding_verbindt_core/repositories/artist_repository.dart';
import 'package:verbeelding_verbindt_core/repositories/auth_repository.dart';
import 'package:verbeelding_verbindt_core/repositories/intro_repository.dart';
import 'package:verbeelding_verbindt_core/repositories/locale_repository.dart';
import 'package:verbeelding_verbindt_core/repositories/location_repository.dart';
import 'package:verbeelding_verbindt_core/repositories/route_generator_repository.dart';
import 'package:verbeelding_verbindt_core/repositories/route_repository.dart';
import 'package:verbeelding_verbindt_core/repositories/speciality_repository.dart';

import 'repositories/artist/firestore/firestore_artist_repository.dart';
import 'repositories/auth/firebase/firebase_auth_repository.dart';
import 'repositories/intro/persistent_storage/persistent_storage_intro_repository_impl.dart.dart';
import 'repositories/locale/persistent_storage/persistent_storage_locale_repository_impl.dart.dart';
import 'repositories/location/geo_locator/geo_locator_location_service_impl.dart';
import 'repositories/persistent_storage/persistent_storage_repository.dart';
import 'repositories/persistent_storage/shared_preferences/shared_preferences_persistent_repository_impl.dart';
import 'repositories/route/persistent_storage/persistent_storage_route_repository.dart';
import 'repositories/route_generator/route_xl/route_xl_repository.dart';
import 'repositories/speciality/firestore/firestore_speciality_repository.dart';

class Module {
  static Future<void> initialize({
    required String routeXlBaseUrl,
    required String routeXlUsername,
    required String routeXlPassword,
  }) async {
    await _initRepositories(
      routeXlBaseUrl: routeXlBaseUrl,
      routeXlUsername: routeXlUsername,
      routeXlPassword: routeXlPassword,
    );
  }

  static Future<void> _initRepositories({
    required String routeXlBaseUrl,
    required String routeXlUsername,
    required String routeXlPassword,
  }) async {
    serviceLocator
      ..registerSingletonAsync<LocationRepository>(
        () async => GlLocationRepositoryImpl(),
      )
      ..registerSingletonAsync<PersistentStorageRepository>(
        () async => SpPersistentStorageRepositoryImpl(
          sharedPreferences: await SharedPreferences.getInstance(),
        ),
      )
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
          persistentStorageRepository: serviceLocator(),
        ),
        dependsOn: [
          PersistentStorageRepository,
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
      ..registerSingletonAsync<AuthRepository>(
        () async => FirebaseAuthRepository(),
        dispose: (param) => param.dispose(),
      )
      ..registerSingletonWithDependencies<LocaleRepository>(
        () => PersistentStorageLocaleRepositoryImpl(
          persistentStorageRepository: serviceLocator(),
        ),
        dispose: (param) => param.dispose(),
        dependsOn: [
          PersistentStorageRepository,
        ],
      )
      ..registerSingletonWithDependencies<IntroRepository>(
        () => PersistentStorageIntroRepositoryImpl(
          persistentStorageRepository: serviceLocator(),
        ),
        dispose: (param) => param.dispose(),
        dependsOn: [
          PersistentStorageRepository,
        ],
      );
  }
}
