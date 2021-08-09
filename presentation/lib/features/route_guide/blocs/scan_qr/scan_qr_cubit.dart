import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supercharged/supercharged.dart';

import '../../../../shared/blocs/cubit_base.dart';
import 'scan_qr_failure.dart';
import 'scan_qr_state.dart';

typedef BarcodeValidator = bool Function(String barcode);

class ScanQrCubit extends CubitBase<ScanQrState> {
  ScanQrCubit({
    this.validator,
  }) : super(const ScanQrState.initializing());

  final BarcodeValidator? validator;

  void setQrController(
    QRViewController qrController,
  ) {
    emit(ScanQrState.loaded(
      qrController: qrController,
    ));
    qrController.scannedDataStream
        .throttleTime(250.milliseconds)
        .takeUntil(close$)
        .listen((barcode) {
      if (validator != null && validator!(barcode.code)) {
        emit(ScanQrState.validScan(
          barcode: barcode.code,
          qrController: qrController,
        ));
      } else {
        emit(ScanQrState.failed(
          failure: ScanQrFailure.invalidScan(
            qrController: qrController,
          ),
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
