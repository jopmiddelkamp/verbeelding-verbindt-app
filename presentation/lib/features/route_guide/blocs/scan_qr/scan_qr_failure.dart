import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

part 'scan_qr_failure.freezed.dart';

@freezed
class ScanQrFailure with _$ScanQrFailure {
  const factory ScanQrFailure.invalidScan({
    required QRViewController qrController,
  }) = InvalidScanFailure;

  const factory ScanQrFailure.general() = GeneralFailure;
}
