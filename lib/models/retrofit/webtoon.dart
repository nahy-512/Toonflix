import 'package:json_annotation/json_annotation.dart';

part 'webtoon.g.dart';

@JsonSerializable()
class Webtoon {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "thumb")
  final String thumb;
  @JsonKey(name: "title")
  final String title;

  Webtoon(this.id, this.thumb, this.title);

  Map<String, dynamic> toJson() => _$WebtoonToJson(this);
  factory Webtoon.fromJson(Map<String, dynamic> json) =>
      _$WebtoonFromJson(json);
}