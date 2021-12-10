import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../../verbeelding_verbindt_ui.dart';

class ScanQrCubit extends CubitBase<ScanQrState> {
  ScanQrCubit({
    required QrCodeValidator qrCodeValidator,
  })  : _qrCodeValidator = qrCodeValidator,
        super(const ScanQrState.initializing());

  final QrCodeValidator _qrCodeValidator;

  void setQrController(
    QRViewController qrController,
  ) {
    emit(ScanQrState.loaded(
      qrController: qrController,
    ));
    qrController.scannedDataStream
        .throttleTime(const Duration(milliseconds: 250))
        .takeUntil(close$)
        .listen((barcode) {
      final isValid = _qrCodeValidator.validate(barcode.code);
      if (isValid) {
        emit(ScanQrState.validScan(
          barcode: barcode.code!,
          qrController: qrController,
        ));
      } else {
        emit(ScanQrState.invalidScan(
          barcode: barcode.code ?? '',
          qrController: qrController,
        ));
      }
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
    return super.close();
  }
}
