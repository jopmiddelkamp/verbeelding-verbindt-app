import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

class DataDependencies {
  const DataDependencies({
    required this.locationRepository,
    required this.artistRepository,
    required this.routeRepository,
    required this.specialityRepository,
    required this.routeGeneratorRepository,
    required this.authRepository,
    required this.localeRepository,
    required this.introRepository,
  });

  final SingletonAsync<LocationRepository> locationRepository;
  final SingletonAsync<ArtistRepository> artistRepository;
  final SingletonAsync<RouteRepository> routeRepository;
  final SingletonAsync<SpecialityRepository> specialityRepository;
  final SingletonAsync<RouteGeneratorRepository> routeGeneratorRepository;
  final SingletonAsync<AuthRepository> authRepository;
  final SingletonAsync<LocaleRepository> localeRepository;
  final SingletonAsync<IntroRepository> introRepository;

  void registerAll() {
    locationRepository.register();
    artistRepository.register();
    routeRepository.register();
    specialityRepository.register();
    routeGeneratorRepository.register();
    authRepository.register();
    localeRepository.register();
    introRepository.register();
  }
}
