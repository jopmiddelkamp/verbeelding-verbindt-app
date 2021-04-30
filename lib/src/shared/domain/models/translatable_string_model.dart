import 'package:json_annotation/json_annotation.dart';

// Settings a default value build.yaml didn't work - 30-04-2020
@JsonSerializable(explicitToJson: true)
class TranslatableStringModel {
  const TranslatableStringModel(
    this.data,
  );

  final Map<String, String> data;

  String get value {
    final defaultCountryCode = 'nl';
    return data[defaultCountryCode] as String;
  }

  @override
  String toString() => 'TranslatableString { ${data.keys.join(',')} }';

  static TranslatableStringModel fromMap(
    Map<String, dynamic> map,
  ) {
    return TranslatableStringModel(
      map.map((key, value) => MapEntry(key, value as String)),
    );
  }

  static TranslatableStringModel fromJson(
    Map<String, dynamic> json,
  ) {
    return TranslatableStringModel(
      json.map((key, value) => MapEntry(key, value as String)),
    );
  }

  Map<String, dynamic> toJson() => data;
}
