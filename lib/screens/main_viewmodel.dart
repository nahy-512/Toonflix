import 'package:flutter/cupertino.dart';
import 'package:toonflix/models/retrofit/webtoon.dart';
import 'package:toonflix/screens/main_repository.dart';

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

}