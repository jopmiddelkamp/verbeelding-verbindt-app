class IntroState {
  const IntroState._({
    this.accepted,
  });

  factory IntroState.initialize() {
    return IntroState._(
      accepted: null,
    );
  }

  factory IntroState.load({
    required bool accepted,
  }) {
    return IntroState._(
      accepted: accepted,
    );
  }

  final bool? accepted;

  bool get loaded => accepted != null;
}
