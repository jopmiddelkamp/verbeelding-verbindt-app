import 'validator.dart';

class QrCodeValidator extends Validator<String> {
  const QrCodeValidator({
    required this.expected,
  });

  final String expected;

  @override
  bool call(
    String? param,
  ) {
    var qrIdRegex = RegExp(r'VV-(.{20})$');
    var match = qrIdRegex.firstMatch(param ?? '');
    // Stop here if it does not match the platform qr id format
    if (match == null) {
      return false;
    }
    return match.group(1) == expected;
  }
}
