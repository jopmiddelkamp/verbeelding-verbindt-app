import 'package:equatable/equatable.dart';

class TranslatableStringDataModel extends Equatable {
  const TranslatableStringDataModel(
    this.data,
  );

  final Map<String, String> data;

  @override
  List<Object?> get props => [data];

  @override
  bool? get stringify => true;

  static TranslatableStringDataModel fromJson(
    Map<String, dynamic> json,
  ) {
    return TranslatableStringDataModel(
      json.map((key, value) => MapEntry(key, value as String)),
    );
  }

  Map<String, dynamic> toJson() => data;
}
