import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:verbeelding_verbindt_core/failures/failure.dart';

import '../../../../shared/bloc/state_base.dart';

class ScanQrState extends StateBase {
  const ScanQrState._({
    required this.qrKey,
    required this.validArtistId,
    required this.scannedArtistId,
    required this.qrController,
    required Failure? failure,
  }) : super(
          failure: failure,
        );

  factory ScanQrState.initialize({
    required String validArtistId,
  }) {
    return ScanQrState._(
      qrKey: GlobalKey(debugLabel: '$ScanQrState'),
      validArtistId: validArtistId,
      scannedArtistId: null,
      qrController: null,
      failure: null,
    );
  }

  final GlobalKey qrKey;
  final String validArtistId;
  final String? scannedArtistId;
  final QRViewController? qrController;

  bool get loaded => qrController != null;

  @override
  String toString() => '''$runtimeType { 
                            qrKey: $qrKey, 
                            validArtistId: $validArtistId, 
                            scannedArtistId: $scannedArtistId, 
                            qrController: $qrController,
                            failure: $failure, 
                          }''';

  ScanQrState copyWith({
    String? scannedArtistId,
    QRViewController? qrController,
    Failure? failure,
  }) {
    return ScanQrState._(
      qrKey: qrKey,
      validArtistId: validArtistId,
      scannedArtistId: scannedArtistId ?? this.scannedArtistId,
      qrController: qrController ?? this.qrController,
      failure: failure ?? this.failure,
    );
  }

  @override
  Future<void> dispose() async {
    qrController?.dispose();
  }
}
