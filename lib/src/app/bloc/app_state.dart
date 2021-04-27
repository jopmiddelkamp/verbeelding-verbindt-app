class AppState {
  const AppState._({
    this.introAccepted,
  });

  factory AppState.initialize() {
    return AppState._(
      introAccepted: null,
    );
  }

  factory AppState.load({
    required bool introAccepted,
  }) {
    return AppState._(
      introAccepted: introAccepted,
    );
  }

  final bool? introAccepted;

  bool get loaded => introAccepted != null;
}
