import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(
  createFactory: false,
  createToJson: false,
)
class TranslatableStringModel {
  const TranslatableStringModel(
    this._data,
  );

  final Map<String, String> _data;

  String get value {
    final defaultCountryCode = 'nl';
    return _data[defaultCountryCode] as String;
  }

  @override
  String toString() => 'TranslatableString { ${_data.keys.join(',')} }';

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

  Map<String, dynamic> toJson() => _data;
}
