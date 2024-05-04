// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'webtoon_episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebtoonEpisode _$WebtoonEpisodeFromJson(Map<String, dynamic> json) =>
    WebtoonEpisode(
      json['id'] as String,
      json['title'] as String,
      json['rating'] as String,
      json['date'] as String,
    );

Map<String, dynamic> _$WebtoonEpisodeToJson(WebtoonEpisode instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'rating': instance.rating,
      'date': instance.date,
    };
