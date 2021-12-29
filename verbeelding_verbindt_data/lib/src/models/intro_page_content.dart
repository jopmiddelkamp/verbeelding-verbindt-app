import 'package:json_annotation/json_annotation.dart';

import '../../verbeelding_verbindt_data.dart';

part 'intro_page_content.g.dart';

// Settings a default value build.yaml didn't work - 30-04-2020
@JsonSerializable(explicitToJson: true)
class IntroPageContentDataModel {
  const IntroPageContentDataModel({
    required this.headerImage,
    required this.title,
    required this.text,
  });

  final ImageDataModel headerImage;
  @TranslatableStringDataModelJsonConverter()
  final TranslatableStringDataModel title;
  @TranslatableStringDataModelJsonConverter()
  final TranslatableStringDataModel text;

  @override
  String toString() => '''$runtimeType { 
                            headerImage: $headerImage,
                            title: $title,
                            text: $text,
                          }''';

  static IntroPageContentDataModel fromJson(Map<String, dynamic> json) =>
      _$IntroPageContentDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$IntroPageContentDataModelToJson(this);
}
