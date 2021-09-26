import 'package:json_annotation/json_annotation.dart';

import '../models/image.dart';
import '../models/translatable_string.dart';

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
  final TranslatableStringDataModel title;
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
