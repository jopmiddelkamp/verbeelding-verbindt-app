class EnvironmentVariables {
  const EnvironmentVariables._();

  // fromEvironment have to be const values
  static const routeXlBaseUrl = String.fromEnvironment(
    'ROUTE_XL_BASE_URL',
    defaultValue: 'https://api.routexl.com',
  );
  static const routeXlUsername = String.fromEnvironment(
    'ROUTE_XL_USERNAME',
    defaultValue: 'register your own at routexl.com',
  );
  static const routeXlPassword = String.fromEnvironment(
    'ROUTE_XL_PASSWORD',
    defaultValue: 'register your own at routexl.com',
  );
}
