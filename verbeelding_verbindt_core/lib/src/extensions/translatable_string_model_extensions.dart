import '../../verbeelding_verbindt_core.dart';

extension TranslatableStringX on Map<String, String> {
  TranslatableString toTranslatableString() {
    return TranslatableString(this);
  }
}
