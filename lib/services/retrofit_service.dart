import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:toonflix/models/retrofit/webtoon.dart';
import 'package:toonflix/models/retrofit/webtoon_detail.dart';
import 'package:toonflix/models/retrofit/webtoon_episode.dart';

part 'retrofit_service.g.dart';

@RestApi(baseUrl: "https://webtoon-crawler.nomadcoders.workers.dev")
abstract class WebtoonApi {
  factory WebtoonApi(Dio dio, {String baseUrl}) = _WebtoonApi;

  @GET("/today")
  Future<List<Webtoon>> getTodayWebtoons();

  @PUT("/{id}")
  Future<WebtoonDetail> getWebtoonDetail(
    @Path("id") String webtoonId);

  @PUT("/{id}/episodes")
  Future<List<WebtoonEpisode>> getWebtoonEpisodes(
      @Path("id") String webtoonId);
}
