import 'package:verbeelding_verbindt_core/entities/page_content/intro_page_content.dart';
import 'package:verbeelding_verbindt_core/failures/failure.dart';

import '../../../../shared/bloc/state_base.dart';

class IntroState extends StateBase {
  IntroState._({
    this.content,
    this.accepted,
    Failure? failure,
  }) : super(
          failure: failure,
        );

  factory IntroState.initialize() {
    return IntroState._();
  }

  factory IntroState.load({
    required IntroPageContentEntity content,
  }) {
    return IntroState._(
      content: content,
    );
  }

  final IntroPageContentEntity? content;
  final bool? accepted;

  bool get loaded => content != null;

  IntroState copyWith({
    IntroPageContentEntity? content,
    bool? accepted,
    Failure? failure,
  }) {
    return IntroState._(
      content: content ?? this.content,
      accepted: accepted ?? this.accepted,
      failure: failure ?? this.failure,
    );
  }
}
