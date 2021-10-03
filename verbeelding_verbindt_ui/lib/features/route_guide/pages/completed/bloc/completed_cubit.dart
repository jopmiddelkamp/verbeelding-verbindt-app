import 'dart:async';

import 'package:verbeelding_verbindt_core/use_cases/route/delete_route_use_case.dart';

import '../../../../../shared/blocs/cubit_base.dart';
import 'completed_state.dart';

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
