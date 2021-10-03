import 'aliases.dart';
import 'use_cases/artist/stream_artists_by_specialty_use_case.dart';
import 'use_cases/auth/get_authenticated_user_use_case.dart';
import 'use_cases/auth/sign_in_anonymously_use_case.dart';
import 'use_cases/auth/stream_authenticated_user_use_case.dart';
import 'use_cases/intro/accept_intro_use_case.dart';
import 'use_cases/intro/get_is_intro_accepted_use_case.dart';
import 'use_cases/locale/get_active_locale_use_case.dart';
import 'use_cases/locale/get_inactive_locales_use_case.dart';
import 'use_cases/locale/set_active_locale_use_case.dart';
import 'use_cases/location/fetch_user_location_use_case.dart';
import 'use_cases/permission/get_permission_status_use_case.dart';
import 'use_cases/permission/request_permission_use_case.dart';
import 'use_cases/route/create_route_use_case.dart';
import 'use_cases/route/delete_route_use_case.dart';
import 'use_cases/route/get_has_users_route_use_case.dart';
import 'use_cases/route/get_users_route_use_case.dart';
import 'use_cases/route/next_route_stop_use_case.dart';
import 'use_cases/route/stream_users_route_use_case.dart';
import 'use_cases/specialty/stream_specialties_use_case.dart';

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
    serviceLocator.registerFactory<StreamArtistBySpecialtyUseCase>(
      () => StreamArtistBySpecialtyUseCase(
        artistRepository: serviceLocator(),
      ),
    );
  }

  static Future<void> initializeAuthUseCases() async {
    serviceLocator
      ..registerFactory<GetAuthenticatedUserUseCase>(
        () => GetAuthenticatedUserUseCase(
          authRepository: serviceLocator(),
        ),
      )
      ..registerFactory<SignInAnonymouslyUseCase>(
        () => SignInAnonymouslyUseCase(
          authRepository: serviceLocator(),
        ),
      )
      ..registerFactory<StreamAuthenticatedUserUseCase>(
        () => StreamAuthenticatedUserUseCase(
          authRepository: serviceLocator(),
        ),
      );
  }

  static Future<void> initializeIntroUseCases() async {
    serviceLocator
      ..registerFactory<AcceptIntroUseCase>(
        () => AcceptIntroUseCase(
          introRepository: serviceLocator(),
        ),
      )
      ..registerFactory<GetIsIntroAcceptedUseCase>(
        () => GetIsIntroAcceptedUseCase(
          introRepository: serviceLocator(),
        ),
      );
  }

  static Future<void> initializeLocaleUseCases() async {
    serviceLocator
      ..registerFactory<GetActiveLocaleUseCase>(
        () => GetActiveLocaleUseCase(
          localeRepository: serviceLocator(),
        ),
      )
      ..registerFactory<GetInactiveLocalesUseCase>(
        () => GetInactiveLocalesUseCase(
          localeRepository: serviceLocator(),
        ),
      )
      ..registerFactory<SetActiveLocaleUseCase>(
        () => SetActiveLocaleUseCase(
          localeRepository: serviceLocator(),
        ),
      );
  }

  static Future<void> initializeLocationUseCases() async {
    serviceLocator.registerFactory<FetchUserLocationUseCase>(
      () => FetchUserLocationUseCase(
        locationRepository: serviceLocator(),
      ),
    );
  }

  static Future<void> initializePermissionUseCases() async {
    serviceLocator
      ..registerFactory<GetPermissionStatusUseCase>(
        () => GetPermissionStatusUseCase(
          permissionRepository: serviceLocator(),
        ),
      )
      ..registerFactory<RequestPermissionUseCase>(
        () => RequestPermissionUseCase(
          permissionRepository: serviceLocator(),
        ),
      );
  }

  static Future<void> initializeRouteUseCases() async {
    serviceLocator
      ..registerFactory<CreateRouteUseCase>(
        () => CreateRouteUseCase(
          artistRepository: serviceLocator(),
          authRepository: serviceLocator(),
          locationRepository: serviceLocator(),
          routeGeneratorRepository: serviceLocator(),
          routeRepository: serviceLocator(),
        ),
      )
      ..registerFactory<DeleteRouteUseCase>(
        () => DeleteRouteUseCase(
          routeRepository: serviceLocator(),
        ),
      )
      ..registerFactory<GetHasUsersRouteUseCase>(
        () => GetHasUsersRouteUseCase(
          authRepository: serviceLocator(),
          routeRepository: serviceLocator(),
        ),
      )
      ..registerFactory<NextRouteStopUseCase>(
        () => NextRouteStopUseCase(
          routeRepository: serviceLocator(),
        ),
      )
      ..registerFactory<StreamUsersRouteUseCase>(
        () => StreamUsersRouteUseCase(
          authRepository: serviceLocator(),
          routeRepository: serviceLocator(),
        ),
      )
      ..registerFactory<GetUsersRouteUseCase>(
        () => GetUsersRouteUseCase(
          authRepository: serviceLocator(),
          routeRepository: serviceLocator(),
        ),
      );
  }

  static Future<void> initializeSpecialtyUseCases() async {
    serviceLocator.registerFactory<StreamSpecialitiesUseCase>(
      () => StreamSpecialitiesUseCase(
        specialtyRepository: serviceLocator(),
      ),
    );
  }
}
