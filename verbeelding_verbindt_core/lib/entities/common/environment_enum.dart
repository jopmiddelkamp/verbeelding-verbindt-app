enum Environment {
  dev,
  stag,
  prod,
}

extension EnvironmentX on Environment {
  bool get isDevelopment => this == Environment.dev;
  bool get isStaging => this == Environment.stag;
  bool get isProduction => this == Environment.prod;
}
