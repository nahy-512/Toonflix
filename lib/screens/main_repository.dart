import 'package:flutter/material.dart';
import 'package:toonflix/models/retrofit/webtoon.dart';
import 'package:toonflix/models/retrofit/webtoon_detail.dart';
import 'package:toonflix/models/retrofit/webtoon_episode.dart';
import 'package:toonflix/services/retrofit_service.dart';

import '../services/dio_service.dart';

// static 대신 레포지토리 자체를 인스턴스로 만들어서 사용 (재활용이 필요한 경우)
class MainRepository {
  static final WebtoonApi _webtoonApi = WebtoonApi(DioService().get());

  /// 오늘의 웹툰 목록 조회
  Future<List<Webtoon>> getTodayWebtoons() async {
    try {
      return await _webtoonApi.getTodayWebtoons();
    } catch (e) {
      debugPrint('Error occurred while get today webtoons: $e');
      return [];
    }
  }

  /// 웹툰 상세 정보 조회
  Future<WebtoonDetail> getWebtoonDetail(
      String id) async {
    try {
      return await _webtoonApi.getWebtoonDetail(id);
    } catch (e) {
      debugPrint('Error occurred while get webtoon info: $e');
      return WebtoonDetail("", "", "", "");
    }
  }

  static Future<List<WebtoonEpisode>> getWebtoonEpisodes(
      String id) async {
    try {
      return await _webtoonApi.getWebtoonEpisodes(id);
    } catch (e) {
      debugPrint('Error occurred while get webtoon episodes: $e');
      return [];
    }
  }
}