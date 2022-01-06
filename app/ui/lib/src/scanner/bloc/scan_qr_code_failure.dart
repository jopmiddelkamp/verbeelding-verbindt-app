import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

part 'scan_qr_code_failure.freezed.dart';

@freezed
class ScanQrCodeFailure with _$ScanQrCodeFailure {
  const factory ScanQrCodeFailure.invalidScan({
    required QRViewController qrController,
  }) = InvalidScanScanQrCodeFailure;

  const factory ScanQrCodeFailure.general() = ScanQrGeneralFailure;
}
