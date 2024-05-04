import 'package:dio/dio.dart';

class DioService {
  static final DioService _instance = DioService._internal();
  factory DioService() => _instance;
  late Dio _dio;

  DioService._internal() {
    var dioBaseOption =
    BaseOptions(baseUrl: "https://webtoon-crawler.nomadcoders.workers.dev");
    _dio = Dio(dioBaseOption);
  }

  Dio get() => _dio;
}