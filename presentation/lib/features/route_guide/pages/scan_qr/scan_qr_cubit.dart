import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supercharged/supercharged.dart';

import '../../../../shared/bloc/cubit_base.dart';
import '../../../../shared/extensions/barcode_extensions.dart';
import 'scan_qr_page.dart';
import 'scan_qr_state.dart';

class ScanQrCubit extends CubitBase<ScanQrState> {
  ScanQrCubit(
    ScanQrPageArguments arguments,
  ) : super(ScanQrState.initialize(
          validArtistId: arguments.currentArtistId,
        ));

  void setQrController(
    QRViewController qrController,
  ) {
    emit(state.copyWith(
      qrController: qrController,
    ));
    qrController.scannedDataStream
        .throttleTime(250.milliseconds)
        .takeUntil(dispose$)
        .listen((barcode) {
      final artistId = barcode.artistId;
      if (state.validScan) {
        qrController.pauseCamera();
        return;
      }
      if (artistId == state.scannedArtistId) {
        return;
      }
      emit(state.copyWith(
        scannedArtistId: artistId,
      ));
    });
  }
}
