import 'package:verbeelding_verbindt_core/entities/page_content/route_completed_page_content.dart';
import 'package:verbeelding_verbindt_core/failures/failure.dart';

import '../../../../shared/bloc/state_base.dart';

class CompletedState extends StateBase {
  CompletedState._({
    this.content,
    Failure? failure,
  }) : super(
          failure: failure,
        );

  factory CompletedState.initialize() {
    return CompletedState._();
  }

  factory CompletedState.load({
    required RouteCompletedPageContentEntity content,
  }) {
    return CompletedState._(
      content: content,
    );
  }

  final RouteCompletedPageContentEntity? content;

  bool get loaded => content != null;

  CompletedState copyWith({
    RouteCompletedPageContentEntity? content,
    Failure? failure,
  }) {
    return CompletedState._(
      content: content ?? this.content,
      failure: failure ?? this.failure,
    );
  }
}
