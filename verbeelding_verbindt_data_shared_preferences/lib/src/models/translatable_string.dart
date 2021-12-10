import 'package:json_annotation/json_annotation.dart';

// Settings a default value build.yaml didn't work - 30-04-2020
@JsonSerializable(explicitToJson: true)
class TranslatableStringDataModel {
  const TranslatableStringDataModel(
    this.data,
  );

  final Map<String, String> data;

  @override
  String toString() => 'TranslatableString { ${data.keys.join(',')} }';

  static TranslatableStringDataModel fromFirebaseMap(
    Map<String, dynamic> map,
  ) {
    return TranslatableStringDataModel(
      map.map((key, value) => MapEntry(key, value as String)),
    );
  }

  static TranslatableStringDataModel fromJson(
    Map<String, dynamic> json,
  ) {
    return TranslatableStringDataModel(
      json.map((key, value) => MapEntry(key, value as String)),
    );
  }

  Map<String, dynamic> toJson() => data;
}
