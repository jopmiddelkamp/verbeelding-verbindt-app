import 'package:verbeelding_verbindt_core/entities/environment_enum.dart';
import 'package:verbeelding_verbindt_core/extensions/string_extensions.dart';

abstract class EnvironmentVariables {
  factory EnvironmentVariables() => const _EnvironmentVariablesImpl();

  Environment get environment;
  RouteXlEnvironmentVariables get routeXl;
}

class _EnvironmentVariablesImpl implements EnvironmentVariables {
  const _EnvironmentVariablesImpl();

  // fromEnvironment have to be const values
  static const _environment = String.fromEnvironment(
    'ENVIRONMENT',
  );

  @override
  Environment get environment => _environment.toEnum(Environment.values);

  @override
  RouteXlEnvironmentVariables get routeXl => RouteXlEnvironmentVariables();
}

abstract class RouteXlEnvironmentVariables {
  factory RouteXlEnvironmentVariables() =>
      const _RouteXlEnvironmentVariablesImpl();

  String get baseUrl;
  String get username;
  String get password;
}

class _RouteXlEnvironmentVariablesImpl implements RouteXlEnvironmentVariables {
  const _RouteXlEnvironmentVariablesImpl();

  static const _baseUrl = String.fromEnvironment(
    'ROUTE_XL_BASE_URL',
    defaultValue: 'https://api.routexl.com',
  );
  static const _username = String.fromEnvironment(
    'ROUTE_XL_USERNAME',
    defaultValue: 'register your own at routexl.com',
  );
  static const _password = String.fromEnvironment(
    'ROUTE_XL_PASSWORD',
    defaultValue: 'register your own at routexl.com',
  );

  @override
  String get baseUrl => _baseUrl;

  @override
  String get username => _username;

  @override
  String get password => _password;
}
