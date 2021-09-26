class TranslatableStringEntity {
  const TranslatableStringEntity(
    this.data,
  );

  final Map<String, String> data;

  String get value {
    const defaultCountryCode = 'nl';
    return data[defaultCountryCode] as String;
  }
}
