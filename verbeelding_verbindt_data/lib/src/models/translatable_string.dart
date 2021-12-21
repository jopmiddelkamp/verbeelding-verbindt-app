class TranslatableStringDataModel {
  const TranslatableStringDataModel(
    this.data,
  );

  final Map<String, String> data;

  @override
  String toString() => 'TranslatableString { ${data.keys.join(',')} }';

  static TranslatableStringDataModel fromJson(
    Map<String, dynamic> json,
  ) {
    return TranslatableStringDataModel(
      json.map((key, value) => MapEntry(key, value as String)),
    );
  }

  Map<String, dynamic> toJson() => data;
}
