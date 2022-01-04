import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

class DataDependencies {
  const DataDependencies({
    required this.artistRepository,
    required this.specialityRepository,
    required this.authRepository,
    required this.routeRepository,
    required this.routeGeneratorRepository,
  });

  final SingletonAsync<ArtistRepository> artistRepository;
  final SingletonAsync<SpecialityRepository> specialityRepository;
  final SingletonAsync<AuthRepository> authRepository;
  final SingletonAsync<RouteRepository> routeRepository;
  final SingletonAsync<RouteGeneratorRepository> routeGeneratorRepository;

  void registerAll() {
    artistRepository.register();
    specialityRepository.register();
    authRepository.register();
    routeRepository.register();
    routeGeneratorRepository.register();
  }
}
