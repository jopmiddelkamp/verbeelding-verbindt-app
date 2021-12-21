import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:rxdart/rxdart.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../../../verbeelding_verbindt_ui.dart';

abstract class ScanQrCodeCubit extends CubitBase<ScanQrCodeState>
    with ReadyMixin {
  ScanQrCodeCubit() : super(const ScanQrCodeState.initializing());

  late StreamSubscription _streamSub;

  @mustCallSuper
  Future<void> init() async {
    readyCompleter.complete();
  }

  Future<bool> validate(
    String value,
  );

  Future<void> process();

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
    _streamSub = qrController.scannedDataStream
        .throttleTime(const Duration(milliseconds: 250))
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
      await process();
      emit(ScanQrCodeState.processed(
        barcode: value,
        qrController: qrController,
      ));
      _streamSub.cancel();
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
