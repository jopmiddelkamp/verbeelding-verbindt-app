import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import 'verbeelding_verbindt_data.dart';

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
    GetIt.instance
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
          persistentStorageRepository: GetIt.instance(),
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
          persistentStorageRepository: GetIt.instance(),
        ),
        dispose: (param) => param.dispose(),
        dependsOn: [
          PersistentStorageRepository,
        ],
      )
      ..registerSingletonWithDependencies<IntroRepository>(
        () => PersistentStorageIntroRepositoryImpl(
          persistentStorageRepository: GetIt.instance(),
        ),
        dispose: (param) => param.dispose(),
        dependsOn: [
          PersistentStorageRepository,
        ],
      );
  }
}
