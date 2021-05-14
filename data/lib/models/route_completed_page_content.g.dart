// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_completed_page_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RouteCompletedPageContentDataModel _$RouteCompletedPageContentDataModelFromJson(
    Map<String, dynamic> json) {
  return RouteCompletedPageContentDataModel(
    headerImage:
        ImageDataModel.fromJson(json['headerImage'] as Map<String, dynamic>),
    text: TranslatableStringDataModel.fromJson(
        json['text'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RouteCompletedPageContentDataModelToJson(
        RouteCompletedPageContentDataModel instance) =>
    <String, dynamic>{
      'headerImage': instance.headerImage.toJson(),
      'text': instance.text.toJson(),
    };
