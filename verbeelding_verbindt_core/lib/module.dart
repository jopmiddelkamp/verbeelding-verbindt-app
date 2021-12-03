import 'package:get_it/get_it.dart';

import 'verbeelding_verbindt_core.dart';

class Module {
  static Future<void> initialize() async {
    await Future.wait([
      initializeArtistUseCases(),
      initializeAuthUseCases(),
      initializeIntroUseCases(),
      initializeLocaleUseCases(),
      initializeLocationUseCases(),
      initializePermissionUseCases(),
      initializeRouteUseCases(),
      initializeSpecialtyUseCases(),
    ]);
  }

  static Future<void> initializeArtistUseCases() async {
    GetIt.instance.registerFactory<StreamArtistBySpecialtyUseCase>(
      () => StreamArtistBySpecialtyUseCase(
        artistRepository: GetIt.instance(),
      ),
    );
  }

  static Future<void> initializeAuthUseCases() async {
    GetIt.instance
      ..registerFactory<GetAuthenticatedUserUseCase>(
        () => GetAuthenticatedUserUseCase(
          authRepository: GetIt.instance(),
        ),
      )
      ..registerFactory<SignInAnonymouslyUseCase>(
        () => SignInAnonymouslyUseCase(
          authRepository: GetIt.instance(),
        ),
      )
      ..registerFactory<StreamAuthenticatedUserUseCase>(
        () => StreamAuthenticatedUserUseCase(
          authRepository: GetIt.instance(),
        ),
      );
  }

  static Future<void> initializeIntroUseCases() async {
    GetIt.instance
      ..registerFactory<AcceptIntroUseCase>(
        () => AcceptIntroUseCase(
          introRepository: GetIt.instance(),
        ),
      )
      ..registerFactory<GetIsIntroAcceptedUseCase>(
        () => GetIsIntroAcceptedUseCase(
          introRepository: GetIt.instance(),
        ),
      );
  }

  static Future<void> initializeLocaleUseCases() async {
    GetIt.instance
      ..registerFactory<GetActiveLocaleUseCase>(
        () => GetActiveLocaleUseCase(
          localeRepository: GetIt.instance(),
        ),
      )
      ..registerFactory<GetInactiveLocalesUseCase>(
        () => GetInactiveLocalesUseCase(
          localeRepository: GetIt.instance(),
        ),
      )
      ..registerFactory<SetActiveLocaleUseCase>(
        () => SetActiveLocaleUseCase(
          localeRepository: GetIt.instance(),
        ),
      );
  }

  static Future<void> initializeLocationUseCases() async {
    GetIt.instance.registerFactory<FetchUserLocationUseCase>(
      () => FetchUserLocationUseCase(
        locationRepository: GetIt.instance(),
      ),
    );
  }

  static Future<void> initializePermissionUseCases() async {
    GetIt.instance
      ..registerFactory<GetPermissionStatusUseCase>(
        () => GetPermissionStatusUseCase(
          permissionRepository: GetIt.instance(),
        ),
      )
      ..registerFactory<RequestPermissionUseCase>(
        () => RequestPermissionUseCase(
          permissionRepository: GetIt.instance(),
        ),
      );
  }

  static Future<void> initializeRouteUseCases() async {
    GetIt.instance
      ..registerFactory<CreateRouteUseCase>(
        () => CreateRouteUseCase(
          artistRepository: GetIt.instance(),
          authRepository: GetIt.instance(),
          locationRepository: GetIt.instance(),
          routeGeneratorRepository: GetIt.instance(),
          routeRepository: GetIt.instance(),
        ),
      )
      ..registerFactory<DeleteRouteUseCase>(
        () => DeleteRouteUseCase(
          routeRepository: GetIt.instance(),
        ),
      )
      ..registerFactory<GetHasUsersRouteUseCase>(
        () => GetHasUsersRouteUseCase(
          authRepository: GetIt.instance(),
          routeRepository: GetIt.instance(),
        ),
      )
      ..registerFactory<NextRouteStopUseCase>(
        () => NextRouteStopUseCase(
          routeRepository: GetIt.instance(),
        ),
      )
      ..registerFactory<StreamUsersRouteUseCase>(
        () => StreamUsersRouteUseCase(
          authRepository: GetIt.instance(),
          routeRepository: GetIt.instance(),
        ),
      )
      ..registerFactory<GetUsersRouteUseCase>(
        () => GetUsersRouteUseCase(
          authRepository: GetIt.instance(),
          routeRepository: GetIt.instance(),
        ),
      );
  }

  static Future<void> initializeSpecialtyUseCases() async {
    GetIt.instance.registerFactory<StreamSpecialitiesUseCase>(
      () => StreamSpecialitiesUseCase(
        specialtyRepository: GetIt.instance(),
      ),
    );
  }
}
