import 'package:json_annotation/json_annotation.dart';

part 'webtoon_detail.g.dart';

@JsonSerializable()
class WebtoonDetail {
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "about")
  final String about;
  @JsonKey(name: "genre")
  final String genre;
  @JsonKey(name: "age")
  final String age;
  // @JsonKey(name: "thumb")
  // final String thumb;


  WebtoonDetail(this.title, this.about, this.genre, this.age);

  Map<String, dynamic> toJson() => _$WebtoonDetailToJson(this);
  factory WebtoonDetail.fromJson(Map<String, dynamic> json) =>
      _$WebtoonDetailFromJson(json);
}
