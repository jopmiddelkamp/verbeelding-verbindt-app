import 'dart:async';

import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../../../verbeelding_verbindt_ui.dart';

class CompletedCubit extends CubitBase<CompletedState> {
  CompletedCubit({
    required this.routeId,
    required DeleteRouteUseCase deleteRouteUseCase,
  })  : _deleteRouteUseCase = deleteRouteUseCase,
        super(const CompletedState.loaded());

  final String routeId;
  final DeleteRouteUseCase _deleteRouteUseCase;

  Future<void> deleteRoute() async {
    await _deleteRouteUseCase(
      routeId,
    );
  }
}
