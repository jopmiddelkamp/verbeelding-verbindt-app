import '../models/translatable_string_model.dart';

extension MapStringStringExtensions on Map<String, String> {
  TranslatableStringModel toTranslatableString() {
    return TranslatableStringModel(this);
  }
}
