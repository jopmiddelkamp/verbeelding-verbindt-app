import 'package:equatable/equatable.dart';

import '../../verbeelding_verbindt_core.dart';

class IsoLanguageGeoLocation extends Equatable {
  const IsoLanguageGeoLocation({
    required this.languageCode,
    required this.countryCode,
  });

  factory IsoLanguageGeoLocation.fromIsoLanguageCode(
    String isoLanguageCode,
  ) {
    final result = _parseIsoLanguageCode(isoLanguageCode);
    if (result == null) {
      // TODO: More specific exception
      throw Exception(
        'Unsupported ISO language code provided: $isoLanguageCode',
      );
    }
    return result;
  }

  final LanguageCode languageCode;
  final CountryCode countryCode;

  static IsoLanguageGeoLocation? _parseIsoLanguageCode(
    String isoLanguageCode,
  ) {
    final result = isoLanguageCode.split('-');
    if (result.length < 2) {
      return null;
    }
    final languageCode = EnumUtils.enumFromStringOrNull(
      LanguageCode.values,
      result[0],
    );
    if (languageCode == null) {
      return null;
    }
    final countryCode = EnumUtils.enumFromStringOrNull(
      CountryCode.values,
      result[1],
    );
    if (countryCode == null) {
      return null;
    }
    return IsoLanguageGeoLocation(
      languageCode: languageCode,
      countryCode: countryCode,
    );
  }

  String get isoLanguageCode {
    final languageCode = EnumUtils.getStringValue(this.languageCode);
    final countryCode = EnumUtils.getStringValue(this.countryCode);
    return '${languageCode.toLowerCase()}-${countryCode.toUpperCase()}';
  }

  @override
  List<Object?> get props => [
        languageCode,
        countryCode,
      ];
}
