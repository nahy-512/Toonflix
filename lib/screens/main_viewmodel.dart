import 'package:flutter/cupertino.dart';
import 'package:toonflix/models/retrofit/webtoon.dart';
import 'package:toonflix/screens/main_repository.dart';

import '../models/retrofit/webtoon_detail.dart';

class MainViewModel with ChangeNotifier {
  late final MainRepository _mainRepository;

  List<Webtoon> _webtoonList = [];
  List<Webtoon> get webtoonList => _webtoonList;

  MainViewModel() {
    _mainRepository = MainRepository();
    _init();
  }

  Future<void> _init() async {
    _getWebtoonList();
  }

  Future<void> _getWebtoonList() async {
    _webtoonList = await _mainRepository.getTodayWebtoons();
    notifyListeners();
  }

  Future<WebtoonDetail> getWebtoonDetail(String id) async {
    return await _mainRepository.getWebtoonDetail(id);
  }
}