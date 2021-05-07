// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intro_page_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IntroPageContentDataModel _$IntroPageContentDataModelFromJson(
    Map<String, dynamic> json) {
  return IntroPageContentDataModel(
    headerImage:
        ImageDataModel.fromJson(json['headerImage'] as Map<String, dynamic>),
    title: TranslatableStringDataModel.fromJson(
        json['title'] as Map<String, dynamic>),
    text: TranslatableStringDataModel.fromJson(
        json['text'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$IntroPageContentDataModelToJson(
        IntroPageContentDataModel instance) =>
    <String, dynamic>{
      'headerImage': instance.headerImage.toJson(),
      'title': instance.title.toJson(),
      'text': instance.text.toJson(),
    };
