import 'package:verbeelding_verbindt_core/failures/failure.dart';

import '../../../../shared/bloc/state_base.dart';

class IntroState extends StateBase {
  IntroState._({
    this.accepted,
    Failure? failure,
  }) : super(
          failure: failure,
        );

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
