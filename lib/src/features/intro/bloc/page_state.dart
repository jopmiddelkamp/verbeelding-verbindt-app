class PageState {
  const PageState._({
    this.accepted,
  });

  factory PageState.initialize() {
    return PageState._(
      accepted: null,
    );
  }

  factory PageState.load({
    required bool accepted,
  }) {
    return PageState._(
      accepted: accepted,
    );
  }

  final bool? accepted;

  bool get loaded => accepted != null;
}
