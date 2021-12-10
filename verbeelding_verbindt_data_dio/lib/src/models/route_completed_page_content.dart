import 'package:json_annotation/json_annotation.dart';

import '../../verbeelding_verbindt_data_dio.dart';

part 'route_completed_page_content.g.dart';

// Settings a default value build.yaml didn't work - 30-04-2020
@JsonSerializable(explicitToJson: true)
class RouteCompletedPageContentDataModel {
  const RouteCompletedPageContentDataModel({
    required this.headerImage,
    required this.text,
  });

  final ImageDataModel headerImage;
  final TranslatableStringDataModel text;

  @override
  String toString() => '''$runtimeType { 
                            headerImage: $headerImage,
                            text: $text,
                          }''';

  static RouteCompletedPageContentDataModel fromJson(
          Map<String, dynamic> json) =>
      _$RouteCompletedPageContentDataModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$RouteCompletedPageContentDataModelToJson(this);
}
