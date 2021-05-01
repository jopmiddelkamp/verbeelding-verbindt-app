import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'environment_variable.dart';
import 'src/features/route_guide/data/repositories/artist/artist_repository.dart';
import 'src/features/route_guide/data/repositories/artist/firestore/firestore_artist_repository.dart';
import 'src/features/route_guide/data/repositories/route/firestore/firestore_route_repository.dart';
import 'src/features/route_guide/data/repositories/route/route_repository.dart';
import 'src/features/route_guide/data/repositories/route_generator/route_generator_repository.dart';
import 'src/features/route_guide/data/repositories/route_generator/route_xl/route_xl_repository.dart';
import 'src/features/route_guide/data/repositories/speciality/firestore/firestore_speciality_repository.dart';
import 'src/features/route_guide/data/repositories/speciality/speciality_repository.dart';
import 'src/features/route_guide/domain/services/artist_service.dart';
import 'src/features/route_guide/domain/services/route_service.dart';
import 'src/features/route_guide/domain/services/speciality_service.dart';
import 'src/shared/domain/models/device_info_model.dart';
import 'src/shared/domain/models/package_info_model.dart';
import 'src/shared/domain/services/barrel.dart';
import 'src/shared/domain/services/location/geo_locator/location_service.dart';
import 'src/shared/domain/services/location/location_service.dart';
import 'src/shared/domain/services/permission/permission_handler/ph_permission_service.dart';
import 'src/shared/domain/services/permission/permission_service.dart';
import 'src/shared/domain/services/persistent_storage/shared_preferences/sp_persistent_storage_service.dart';

final serviceLocator = GetIt.instance;

Future<void> initServiceLocator(
  Environment environment,
) async {
  await _initEnvironment(
    environment,
  );

  await serviceLocator.allReady();

  _initRepositories();
  await _initServices();

  await serviceLocator.allReady();

  await _initDeviceInfo();
  await _initPackageInfo();
}

Future<void> _initEnvironment(
  Environment environment,
) async {
  serviceLocator.registerSingletonAsync<EnvironmentVariables>(
    () async => EnvironmentVariablesImpl(
      environment: environment,
    ),
  );
}

void _initRepositories() {
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
    ..registerSingletonWithDependencies<RouteGeneratorRepository>(
      () => RouteXlRouteGeneratorRepository(
        http: Dio(), // Need custom
        env: serviceLocator<EnvironmentVariables>(),
      ),
      dependsOn: [
        Dio,
        EnvironmentVariables,
      ],
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
    ..registerSingletonWithDependencies<RouteService>(
      () => RouteServiceImpl(
        routeRepository: serviceLocator<RouteRepository>(),
        routeGeneratorRepository: serviceLocator<RouteGeneratorRepository>(),
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
        persistentStorageService: serviceLocator<PersistentStorageService>(),
      ),
      dependsOn: [
        PersistentStorageService,
      ],
    );
}

Future<void> _initDeviceInfo() async {
  if (Platform.isIOS) {
    final deviceInfoPlugin = await DeviceInfoPlugin().iosInfo;
    final deviceInfo = IosDeviceInfoModel(
      name: deviceInfoPlugin.name,
      systemName: deviceInfoPlugin.systemName,
      systemVersion: deviceInfoPlugin.systemVersion,
      model: deviceInfoPlugin.model,
      isPhysicalDevice: deviceInfoPlugin.isPhysicalDevice,
    );
    serviceLocator.registerSingleton(deviceInfo);
  } else if (Platform.isAndroid) {
    final deviceInfoPlugin = await DeviceInfoPlugin().androidInfo;
    final deviceInfo = AndroidDeviceInfoModel(
      manufacturer: deviceInfoPlugin.manufacturer,
      model: deviceInfoPlugin.model,
      androidVersion: deviceInfoPlugin.version.release,
      androidSDK: deviceInfoPlugin.version.sdkInt,
      isPhysicalDevice: deviceInfoPlugin.isPhysicalDevice,
    );
    serviceLocator.registerSingleton(deviceInfo);
  } else {
    debugPrint(
        'No device info support for current platform. ${Platform.executable}');
  }
}

Future<void> _initPackageInfo() async {
  final packageInfoPlugin = await PackageInfo.fromPlatform();
  final packageInfo = PackageInfoModel(
    packageName: packageInfoPlugin.packageName,
    buildNumber: packageInfoPlugin.buildNumber,
    version: packageInfoPlugin.version,
  );
  serviceLocator.registerSingleton(packageInfo);
}
