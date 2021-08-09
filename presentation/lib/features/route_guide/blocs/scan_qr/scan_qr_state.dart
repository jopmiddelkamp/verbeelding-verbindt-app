import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'scan_qr_failure.dart';

part 'scan_qr_state.freezed.dart';

@freezed
class ScanQrState with _$ScanQrState {
  const factory ScanQrState.initializing() = InitializingScanQrState;

  const factory ScanQrState.loaded({
    required QRViewController qrController,
  }) = LoadedScanQrState;

  const factory ScanQrState.validScan({
    required String barcode,
    required QRViewController qrController,
  }) = ValidScanScanQrState;

  const factory ScanQrState.failed({
    required ScanQrFailure failure,
  }) = FailureScanQrState;
}
