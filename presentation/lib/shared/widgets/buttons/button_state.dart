import 'package:verbeelding_verbindt_core/failures/failure.dart';

import '../../bloc/state_base.dart';

class ButtonState extends StateBase {
  ButtonState._({
    required this.busy,
    required Failure? failure,
  }) : super(
          failure: failure,
        );

  factory ButtonState.initialize() {
    return ButtonState._(
      busy: false,
      failure: null,
    );
  }

  final bool busy;

  ButtonState copyWith({
    bool? busy,
    Failure? failure,
  }) {
    return ButtonState._(
      busy: busy ?? this.busy,
      failure: failure ?? this.failure,
    );
  }
}
