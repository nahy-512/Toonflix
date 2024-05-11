import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toonflix/models/retrofit/webtoon.dart';

import '../widgets/webtoon_widget.dart';
import 'main_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainViewModel mainViewModel = Provider.of<MainViewModel>(context);

    final List<Webtoon> webtoons = mainViewModel.webtoonList;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400),
        ),
      ),
      body: mainViewModel.webtoonList.isNotEmpty
        ? Column(
        children: [
          const SizedBox(height: 50,),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: webtoons.length,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              itemBuilder: (BuildContext context, int index) {
                return WebtoonItem(
                  title: webtoons[index].title,
                  thumb: webtoons[index].thumb,
                  id: webtoons[index].id,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 40), // 아이템들 사이에 구분자를 넣어주는 역할
            ),
          ),
        ],
        )
        : const Center(
          child: CircularProgressIndicator(),
        ),
    );
  }
}