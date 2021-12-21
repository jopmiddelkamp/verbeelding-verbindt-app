import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:rxdart/rxdart.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../../../verbeelding_verbindt_ui.dart';

abstract class ScanQrCodeCubit extends CubitBase<ScanQrCodeState>
    with ReadyMixin {
  ScanQrCodeCubit() : super(const ScanQrCodeState.initializing()) {
    _streamSub = stream.listen((state) {
      if (state is ScanQrCodeValidScan) {
        process(state);
      }
    });
  }

  late StreamSubscription _streamSub;

  @mustCallSuper
  Future<void> init() async {
    readyCompleter.complete();
  }

  Future<bool> validate(
    String value,
  );

  Future<void> process(
    ScanQrCodeValidScan state,
  );

  Future<void> setQrController(
    QRViewController qrController,
  ) async {
    await onReady;
    if (state is ScanQrCodeStateInvalidParams) {
      return;
    }
    emit(ScanQrCodeState.loaded(
      qrController: qrController,
    ));
    qrController.scannedDataStream
        .throttleTime(const Duration(milliseconds: 250))
        .takeUntil(close$)
        .listen((barcode) async {
      final value = barcode.code;
      if (value == null) {
        return;
      }
      final isValid = await validate(value);
      if (!isValid) {
        emit(ScanQrCodeState.invalidScan(
          barcode: value,
          qrController: qrController,
        ));
        return;
      }
      emit(ScanQrCodeState.validScan(
        barcode: value,
        qrController: qrController,
      ));
    });
  }

  @override
  Future<void> close() {
    state.maybeMap(
      loaded: (state) => state.qrController.dispose(),
      validScan: (state) => state.qrController.dispose(),
      failed: (state) => state.failure.maybeMap(
        invalidScan: (failure) => failure.qrController.dispose(),
        orElse: () {},
      ),
      orElse: () {},
    );
    _streamSub.cancel();
    return super.close();
  }
}
