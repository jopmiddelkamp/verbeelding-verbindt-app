import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

class DataDependencies {
  const DataDependencies({
    required this.routeRepository,
    required this.localeRepository,
    required this.introRepository,
  });

  final SingletonAsync<RouteRepository> routeRepository;
  final SingletonAsync<LocaleRepository> localeRepository;
  final SingletonAsync<IntroRepository> introRepository;

  void registerAll() {
    routeRepository.register();
    localeRepository.register();
    introRepository.register();
  }
}
