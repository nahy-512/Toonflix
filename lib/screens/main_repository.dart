import 'package:flutter/material.dart';
import 'package:toonflix/models/retrofit/webtoon.dart';
import 'package:toonflix/models/retrofit/webtoon_detail.dart';
import 'package:toonflix/models/retrofit/webtoon_episode.dart';
import 'package:toonflix/services/retrofit_service.dart';

import '../services/dio_service.dart';

class MainRepository {
  static final WebtoonApi _webtoonApi = WebtoonApi(DioService().get());

  static Future<List<Webtoon>> getTodayWebtoons() async {
    try {
      return await _webtoonApi.getTodayWebtoons();
    } catch (e) {
      debugPrint('Error occurred while get today webtoons: $e');
      return [];
    }
  }

  static Future<WebtoonDetail> getWebtoonDetail(
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