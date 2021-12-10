import '../verbeelding_verbindt_core.dart';

abstract class EnvironmentVariables {
  Environment get environment;
  RouteXlEnvironmentVariables get routeXl;
}

abstract class RouteXlEnvironmentVariables {
  String get baseUrl;
  String get username;
  String get password;
}
