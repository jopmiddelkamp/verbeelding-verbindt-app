import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'environment_variable.dart';
import 'src/common/services/barrel.dart';
import 'src/common/services/location/geo_locator/location_service.dart';
import 'src/common/services/location/location_service.dart';
import 'src/common/services/permission/permission_handler/ph_location_permission_service.dart';
import 'src/common/services/permission/permission_service.dart';
import 'src/common/services/persistent_storage/shared_preferences/sp_persistent_storage_service.dart';
import 'src/route_planner/repositories/artist/artist_repository.dart';
import 'src/route_planner/repositories/artist/firestore/firestore_artist_repository.dart';
import 'src/route_planner/repositories/route/firestore/firestore_route_repository.dart';
import 'src/route_planner/repositories/route/route_repository.dart';
import 'src/route_planner/repositories/route_generator/route_generator_repository.dart';
import 'src/route_planner/repositories/route_generator/route_xl/route_xl_repository.dart';
import 'src/route_planner/repositories/speciality/firestore/firestore_speciality_repository.dart';
import 'src/route_planner/repositories/speciality/speciality_repository.dart';
import 'src/route_planner/services/artist_service.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator(
  Environment environment,
) async {
  await _initEnvironment(
    environment,
  );

  await sl.allReady();

  _initRepositories();
  await _initServices();

  await sl.allReady();
}

Future<void> _initEnvironment(
  Environment environment,
) async {
  sl.registerSingletonAsync<EnvironmentVariables>(
    () async => EnvironmentVariablesImpl(
      environment: environment,
    ),
  );
}

void _initRepositories() {
  sl
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
    ..registerSingletonWithDependencies<RouteGeneratorRepository>(
      () => RouteXlRouteGeneratorRepository(
        http: Dio(), // Need custom
        env: sl<EnvironmentVariables>(),
      ),
      dependsOn: [
        Dio,
        EnvironmentVariables,
      ],
    );
}

Future<void> _initServices() async {
  final sp = await SharedPreferences.getInstance();
  sl
    ..registerSingletonWithDependencies<ArtistService>(
      () => ArtistServiceImpl(
        artistRepository: sl<ArtistRepository>(),
      ),
      dependsOn: [
        ArtistRepository,
      ],
    )
    ..registerSingletonWithDependencies<SpecialityService>(
      () => SpecialityServiceImpl(
        specialityRepository: sl<SpecialityRepository>(),
      ),
      dependsOn: [
        SpecialityRepository,
      ],
    )
    ..registerSingletonWithDependencies<RouteService>(
      () => RouteServiceImpl(
        routeRepository: sl<RouteRepository>(),
        routeGeneratorRepository: sl<RouteGeneratorRepository>(),
      ),
      dependsOn: [
        RouteRepository,
        RouteGeneratorRepository,
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
        persistentStorageService: sl<PersistentStorageService>(),
      ),
      dependsOn: [
        PersistentStorageService,
      ],
    );
  // final deviceInfo = DeviceInfoPlugin();
  // sl.registerSingletonAsync<DeviceInfoService>(
  //   () async => DeviceInfoServicePackageInfoImpl(
  //     iosDeviceInfo: Platform.isIOS ? await deviceInfo.iosInfo : null,
  //     androidDeviceInfo:
  //         Platform.isAndroid ? await deviceInfo.androidInfo : null,
  //   ),
  // );
  // final packageInfo = await PackageInfo.fromPlatform();
  // sl.registerSingletonAsync<PackageInfoService>(
  //   () async => PackageInfoServiceImpl(
  //     packageInfo,
  //   ),
  // );
}
