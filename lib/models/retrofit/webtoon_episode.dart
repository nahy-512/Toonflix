import 'package:json_annotation/json_annotation.dart';

part 'webtoon_episode.g.dart';

@JsonSerializable()
class WebtoonEpisode {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "rating")
  final String rating;
  @JsonKey(name: "date")
  final String date;

  WebtoonEpisode(this.id, this.title, this.rating, this.date);

  Map<String, dynamic> toJson() => _$WebtoonEpisodeToJson(this);
  factory WebtoonEpisode.fromJson(Map<String, dynamic> json) =>
      _$WebtoonEpisodeFromJson(json);
}