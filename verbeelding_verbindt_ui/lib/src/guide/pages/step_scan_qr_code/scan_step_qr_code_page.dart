import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../verbeelding_verbindt_ui.dart';

class StepScanQrCodeParams extends DelegatingMap<String, String> {
  StepScanQrCodeParams({
    required int stepIndex,
  }) : super({
          stepIndexKey: stepIndex.toString(),
        });

  StepScanQrCodeParams.fromParams(Map<String, String> base) : super(base);

  static const String stepIndexKey = 'index';

  int get stepIndex => int.parse(this[stepIndexKey]!);

  bool validate() => this[stepIndexKey] != null && stepIndex > -1;
}

class StepScanQrCodePage extends ScanQrCodePage {
  StepScanQrCodePage(
    StepScanQrCodeParams params, {
    Key? key,
  }) : super(
          cubitBuilder: (_) => StepScanQrCodeCubit(
            params: params,
            completeRouteStopUseCase: GetIt.instance(),
            getUsersRouteUseCase: GetIt.instance(),
          )..init(),
          key: key,
        );

  static const String name = 'step_scan_qr_code';

  static void go(
    BuildContext context, {
    required StepScanQrCodeParams params,
  }) {
    context.goNamed(
      name,
      params: params,
    );
  }
}
