import '../../verbeelding_verbindt_core.dart';

extension TranslatableStringExtensions on Map<String, String> {
  TranslatableStringEntity toTranslatableString() {
    return TranslatableStringEntity(this);
  }
}
