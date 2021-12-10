import '../../verbeelding_verbindt_core.dart';

extension TranslatableStringExtensions on Map<String, String> {
  TranslatableStringGeoLocation toTranslatableString() {
    return TranslatableStringGeoLocation(this);
  }
}
