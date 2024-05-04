// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'webtoon_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebtoonDetail _$WebtoonDetailFromJson(Map<String, dynamic> json) =>
    WebtoonDetail(
      json['title'] as String,
      json['about'] as String,
      json['genre'] as String,
      json['age'] as String,
    );

Map<String, dynamic> _$WebtoonDetailToJson(WebtoonDetail instance) =>
    <String, dynamic>{
      'title': instance.title,
      'about': instance.about,
      'genre': instance.genre,
      'age': instance.age,
    };
