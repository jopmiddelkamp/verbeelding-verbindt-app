abstract class AppState {
  const AppState() : super();
}

class AppInitializing extends AppState {
  @override
  String toString() => 'AppInitializing { }';
}

class AppInitialized extends AppState {
  const AppInitialized({
    required this.introAccepted,
  });

  final bool introAccepted;

  @override
  String toString() => 'AppInitialized { introAccepted: $introAccepted }';
}

class AppAppInitializationError extends AppState {
  const AppAppInitializationError({
    required this.message,
  });

  final String message;

  @override
  String toString() => 'AppAppInitializationError { message: \'$message\' }';
}
