import 'package:verbeelding_verbindt_core/entities/page_content/intro_page_content.dart';
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
    return IntroState._();
  }

  final bool? accepted;

  IntroState copyWith({
    IntroPageContentEntity? content,
    bool? accepted,
    Failure? failure,
  }) {
    return IntroState._(
      accepted: accepted ?? this.accepted,
      failure: failure ?? this.failure,
    );
  }
}
