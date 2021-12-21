import '../../../verbeelding_verbindt_ui.dart';

class QrCodeValidator extends ExactValueValidator<String> {
  QrCodeValidator({
    required String expectedValue,
  }) : super(expectedValue: expectedValue);

  final qrCodeValueRegExp = RegExp(r'VV-(.{1,})$');

  @override
  bool validate(
    String? param,
  ) {
    var match = qrCodeValueRegExp.firstMatch(param ?? '');
    // Stop here if it does not match the platform qr id format
    if (match == null) {
      return false;
    }
    return super.validate(match.group(1)!);
  }
}
