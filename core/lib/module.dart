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

  static void _initServices() {
    final deviceId = serviceLocator<DeviceInfoEntity>().id;
    serviceLocator
      ..registerSingletonWithDependencies<RouteService>(
        () => RouteServiceImpl(
          deviceId: deviceId,
          routeRepository: serviceLocator(),
          routeGeneratorRepository: serviceLocator(),
        ),
        dependsOn: [
          RouteRepository,
          RouteGeneratorRepository,
        ],
      );
  }
}
