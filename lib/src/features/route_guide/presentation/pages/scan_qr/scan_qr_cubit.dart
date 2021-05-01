import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'scan_qr_page.dart';
import 'scan_qr_state.dart';

class ScanQrCubit extends Cubit<ScanQrState> {
  ScanQrCubit(
    ScanQrPageArguments arguments,
  ) : super(ScanQrState.initialize(
          validArtistId: arguments.currentArtistId,
        ));

  void qrScanned(
    String value,
  ) {
    final artistId = parseQRCode(value);
    if (artistId == null) {
      return;
    }
    emit(state.copyWith(
      scannedArtistId: artistId,
    ));
  }

  String? parseQRCode(
    String data,
  ) {
    // Parse the scan data
    var qrIdRegex = RegExp(r'VV-([0-9a-fA-F]{20})$');
    var match = qrIdRegex.firstMatch(data);
    // Stop here if it does not match the platform qr id format
    if (match == null) {
      return null;
    }
    // Get uuid
    return match.group(1);
  }

  void setQrController(
    QRViewController qrController,
  ) {
    emit(state.copyWith(
      qrController: qrController,
    ));
  }

  @override
  Future<void> close() async {
    await state.dispose();
    return super.close();
  }
}
