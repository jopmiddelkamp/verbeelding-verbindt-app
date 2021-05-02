import 'dart:io';

import 'package:get_it/get_it.dart';

import 'entities/device_info.dart';
import 'repositories/route_generator_repository.dart';
import 'repositories/route_repository.dart';
import 'services/route_service.dart';

final serviceLocator = GetIt.instance;

class Module {
  static Future<void> initialize() async {
    _initServices();
  }
}

void _initServices() {
  final deviceId = Platform.isIOS
      ? serviceLocator<IosDeviceInfoEntity>().id
      : serviceLocator<AndroidDeviceInfoEntity>().id;
  serviceLocator
    ..registerSingletonWithDependencies<RouteService>(
      () => RouteServiceImpl(
        deviceId: deviceId,
        routeRepository: serviceLocator<RouteRepository>(),
        routeGeneratorRepository: serviceLocator<RouteGeneratorRepository>(),
      ),
      dependsOn: [
        RouteRepository,
        RouteGeneratorRepository,
      ],
    );
}
