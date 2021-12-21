import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

class DataDependencies {
  const DataDependencies({
    required this.routeGeneratorRepository,
  });

  final SingletonAsync<RouteGeneratorRepository> routeGeneratorRepository;

  void registerAll() {
    routeGeneratorRepository.register();
  }
}
