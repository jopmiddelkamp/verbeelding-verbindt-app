class TranslatableStringEntity {
  const TranslatableStringEntity(
    this.data,
  );

  final Map<String, String> data;

  String get value {
    final defaultCountryCode = 'nl';
    return data[defaultCountryCode] as String;
  }
}
