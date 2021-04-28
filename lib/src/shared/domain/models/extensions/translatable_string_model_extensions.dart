import '../translatable_string_model.dart';

extension TranslatableStringModelExtensions on Map<String, String> {
  TranslatableStringModel toTranslatableString() {
    return TranslatableStringModel(this);
  }
}
