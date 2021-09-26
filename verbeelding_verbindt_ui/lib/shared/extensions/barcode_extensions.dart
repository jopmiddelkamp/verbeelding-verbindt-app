import 'package:qr_code_scanner/qr_code_scanner.dart';

extension BarcodeExtension on Barcode {
  String? get artistId {
    final code = this.code;
    // Parse the scan data
    var qrIdRegex = RegExp(r'VV-(.{20})$');
    var match = qrIdRegex.firstMatch(code);
    // Stop here if it does not match the platform qr id format
    if (match == null) {
      return null;
    }
    // Get uuid
    return match.group(1);
  }
}
