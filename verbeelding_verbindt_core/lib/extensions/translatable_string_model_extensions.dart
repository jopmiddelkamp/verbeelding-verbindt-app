import '../entities/common/translatable_string.dart';

extension TranslatableStringExtensions on Map<String, String> {
  TranslatableStringEntity toTranslatableString() {
    return TranslatableStringEntity(this);
  }
}
