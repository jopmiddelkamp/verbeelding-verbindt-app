import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../../../../verbeelding_verbindt_ui.dart';

part 'scan_qr_code_state.freezed.dart';

@freezed
class ScanQrCodeState with _$ScanQrCodeState {
  const factory ScanQrCodeState.initializing() = ScanQrCodeInitializing;

  const factory ScanQrCodeState.loaded({
    required QRViewController qrController,
  }) = ScanQrCodeLoaded;

  const factory ScanQrCodeState.validScan({
    required String barcode,
    required QRViewController qrController,
  }) = ScanQrCodeValidScan;

  const factory ScanQrCodeState.processed({
    required String barcode,
    required QRViewController qrController,
  }) = ScanQrCodeProcessed;

  const factory ScanQrCodeState.invalidScan({
    required String barcode,
    required QRViewController qrController,
  }) = ScanQrCodeInvalidScan;

  const factory ScanQrCodeState.invalidParams() = ScanQrCodeStateInvalidParams;

  const factory ScanQrCodeState.failed({
    required ScanQrCodeFailure failure,
  }) = ScanQrCodeFailed;
}
