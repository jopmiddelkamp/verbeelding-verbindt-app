class ArtistIdUtils {
  static String? parse(
    String code,
  ) {
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

  static bool isValid(String code) => parse(code) != null;
}
