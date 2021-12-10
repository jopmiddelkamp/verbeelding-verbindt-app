import 'package:get_it/get_it.dart';

import '../verbeelding_verbindt_core.dart';

Future<CoreDependencies> getDependencies(
  EnvironmentVariables environmentVariables,
) async {
  return CoreDependencies(dependencies: [
    ..._initializeArtistUseCases(),
    ..._initializeAuthUseCases(),
    ..._initializeIntroUseCases(),
    ..._initializeLocaleUseCases(),
    ..._initializePermissionUseCases(),
    ..._initializeRouteUseCases(),
    ..._initializeSpecialtyUseCases(),
  ]);
}

List<Factory> _initializeArtistUseCases() {
  return [
    Factory<StreamArtistBySpecialtyUseCase>(
      () => StreamArtistBySpecialtyUseCase(
        artistRepository: GetIt.instance(),
      ),
    ),
  ];
}

List<Factory> _initializeAuthUseCases() {
  return [
    Factory<GetAuthenticatedUserUseCase>(
      () => GetAuthenticatedUserUseCase(
        authRepository: GetIt.instance(),
      ),
    ),
    Factory<SignInAnonymouslyUseCase>(
      () => SignInAnonymouslyUseCase(
        authRepository: GetIt.instance(),
      ),
    ),
    Factory<StreamAuthenticatedUserUseCase>(
      () => StreamAuthenticatedUserUseCase(
        authRepository: GetIt.instance(),
      ),
    ),
  ];
}

List<Factory> _initializeIntroUseCases() {
  return [
    Factory<AcceptIntroUseCase>(
      () => AcceptIntroUseCase(
        introRepository: GetIt.instance(),
      ),
    ),
    Factory<GetIsIntroAcceptedUseCase>(
      () => GetIsIntroAcceptedUseCase(
        introRepository: GetIt.instance(),
      ),
    ),
  ];
}

List<Factory> _initializeLocaleUseCases() {
  return [
    Factory<GetActiveLocaleUseCase>(
      () => GetActiveLocaleUseCase(
        localeRepository: GetIt.instance(),
      ),
    ),
    Factory<GetInactiveLocalesUseCase>(
      () => GetInactiveLocalesUseCase(
        localeRepository: GetIt.instance(),
      ),
    ),
    Factory<SetActiveLocaleUseCase>(
      () => SetActiveLocaleUseCase(
        localeRepository: GetIt.instance(),
      ),
    ),
  ];
}

List<Factory> _initializePermissionUseCases() {
  return [
    Factory<GetPermissionStatusUseCase>(
      () => GetPermissionStatusUseCase(
        permissionRepository: GetIt.instance(),
      ),
    ),
    Factory<RequestPermissionUseCase>(
      () => RequestPermissionUseCase(
        permissionRepository: GetIt.instance(),
      ),
    ),
  ];
}

List<Factory> _initializeRouteUseCases() {
  return [
    Factory<CreateRouteUseCase>(
      () => CreateRouteUseCase(
        artistRepository: GetIt.instance(),
        authRepository: GetIt.instance(),
        routeGeneratorRepository: GetIt.instance(),
        routeRepository: GetIt.instance(),
      ),
    ),
    Factory<DeleteRouteUseCase>(
      () => DeleteRouteUseCase(
        routeRepository: GetIt.instance(),
      ),
    ),
    Factory<GetHasUsersRouteUseCase>(
      () => GetHasUsersRouteUseCase(
        authRepository: GetIt.instance(),
        routeRepository: GetIt.instance(),
      ),
    ),
    Factory<NextRouteStopUseCase>(
      () => NextRouteStopUseCase(
        routeRepository: GetIt.instance(),
      ),
    ),
    Factory<StreamUsersRouteUseCase>(
      () => StreamUsersRouteUseCase(
        authRepository: GetIt.instance(),
        routeRepository: GetIt.instance(),
      ),
    ),
    Factory<GetUsersRouteUseCase>(
      () => GetUsersRouteUseCase(
        authRepository: GetIt.instance(),
        routeRepository: GetIt.instance(),
      ),
    ),
  ];
}

List<Factory> _initializeSpecialtyUseCases() {
  return [
    Factory<StreamSpecialitiesUseCase>(
      () => StreamSpecialitiesUseCase(
        specialtyRepository: GetIt.instance(),
      ),
    ),
  ];
}
