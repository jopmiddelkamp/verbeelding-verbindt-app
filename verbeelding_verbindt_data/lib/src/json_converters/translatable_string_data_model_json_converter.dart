import 'package:json_annotation/json_annotation.dart';

import '../../verbeelding_verbindt_data.dart';

class TranslatableStringDataModelJsonConverter
    implements
        JsonConverter<TranslatableStringDataModel, Map<String, dynamic>> {
  const TranslatableStringDataModelJsonConverter();

  @override
  TranslatableStringDataModel fromJson(
    Map<String, dynamic> json,
  ) {
    return TranslatableStringDataModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(
    TranslatableStringDataModel object,
  ) {
    return object.toJson();
  }
}
