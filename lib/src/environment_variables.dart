import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

class EnvironmentVariablesImpl implements EnvironmentVariables {
  const EnvironmentVariablesImpl();

  // fromEnvironment have to be const values
  static const _environment = String.fromEnvironment(
    'ENVIRONMENT',
  );

  @override
  Environment get environment => _environment.toEnum(Environment.values);

  @override
  RouteXlEnvironmentVariables get routeXl =>
      const RouteXlEnvironmentVariablesImpl();
}

class RouteXlEnvironmentVariablesImpl implements RouteXlEnvironmentVariables {
  const RouteXlEnvironmentVariablesImpl();

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
