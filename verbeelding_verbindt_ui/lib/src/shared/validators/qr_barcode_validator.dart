import '../../../verbeelding_verbindt_ui.dart';

class QrCodeValidator extends Validator<String> {
  const QrCodeValidator({
    required this.expected,
  });

  final String expected;

  @override
  bool validate(
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
