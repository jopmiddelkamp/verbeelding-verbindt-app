import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:verbeelding_verbindt_core/repositories/artist_repository.dart';
import 'package:verbeelding_verbindt_core/repositories/route_generator_repository.dart';
import 'package:verbeelding_verbindt_core/repositories/route_repository.dart';
import 'package:verbeelding_verbindt_core/repositories/speciality_repository.dart';
import 'package:verbeelding_verbindt_core/services/artist_service.dart';
import 'package:verbeelding_verbindt_core/services/location_service.dart';
import 'package:verbeelding_verbindt_core/services/permission_service.dart';
import 'package:verbeelding_verbindt_core/services/persistent_storage_service.dart';
import 'package:verbeelding_verbindt_core/services/speciality_service.dart';

import 'repositories/artist/firestore/firestore_artist_repository.dart';
import 'repositories/route/firestore/firestore_route_repository.dart';
import 'repositories/route_generator/route_xl/route_xl_repository.dart';
import 'repositories/speciality/firestore/firestore_speciality_repository.dart';
import 'services/location/geo_locator/geo_locator_location_service_impl.dart';
import 'services/permission/permission_handler/permission_handler_permission_service_impl.dart';
import 'services/persistent_storage/shared_preferences/shared_preferences_persistent_storage_impl.dart';

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
    await _initServices();
  }
}

void _initRepositories({
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

Future<void> _initServices() async {
  final sp = await SharedPreferences.getInstance();
  serviceLocator
    ..registerSingletonWithDependencies<ArtistService>(
      () => ArtistServiceImpl(
        artistRepository: serviceLocator<ArtistRepository>(),
      ),
      dependsOn: [
        ArtistRepository,
      ],
    )
    ..registerSingletonWithDependencies<SpecialityService>(
      () => SpecialityServiceImpl(
        specialityRepository: serviceLocator<SpecialityRepository>(),
      ),
      dependsOn: [
        SpecialityRepository,
      ],
    )
    ..registerSingletonAsync<LocationService>(
      () async => GlLocationServiceImpl(),
    )
    ..registerSingletonAsync<PersistentStorageService>(
      () async => SpPersistentStorageServiceImpl(
        sharedPreferences: sp,
      ),
    )
    ..registerSingletonWithDependencies<PermissionService>(
      () => PhLocationPermissionServiceImpl(
        persistentStorageService: serviceLocator<PersistentStorageService>(),
      ),
      dependsOn: [
        PersistentStorageService,
      ],
    );
}
