import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toonflix/models/retrofit/webtoon_detail.dart';
import 'package:toonflix/models/retrofit/webtoon_episode.dart';
import 'package:toonflix/screens/main_repository.dart';
import 'package:toonflix/screens/main_viewmodel.dart';

import '../widgets/episode_widget.dart';

class DetailScreen extends StatefulWidget {

  final String title, thumb, id;

  const DetailScreen({super.key,
    required this.title,
    required this.thumb,
    required this.id
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  late Future<WebtoonDetail> webtoon;
  late Future<List<WebtoonEpisode>> episodes;
  late SharedPreferences prefs;
  bool isLiked = false;

  late final MainViewModel _mainViewModel;

  Future initPrefs() async {
    // 사용자 저장소에 connection
    prefs = await SharedPreferences.getInstance();
    // 저장소에서 사용자가 저장한 웹툰의 id 목록 조회
    final likedToons = prefs.getStringList('likedToons');
    if (likedToons != null) {
      if (likedToons.contains(widget.id)) { // 사용자가 좋아요한 웹툰
        setState(() {
          isLiked = true;
        });
      }
    } else {
      await prefs.setStringList('likedToons', []); // 사용자가 처음으로 앱을 실행하는 경우
    }
  }

  onHeartTap() async {
    final likedToons = prefs.getStringList('likedToons');
    if (likedToons != null) {
      if (isLiked) { // 좋아요 취소
        likedToons.remove(widget.id);
      } else { // 좋아요
        likedToons.add(widget.id);
      }
      // 사용자의 저장소에 리스트 다시 저장
      await prefs.setStringList('likedToons', likedToons);
      setState(() {
        isLiked = !isLiked;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    episodes = MainRepository.getWebtoonEpisodes(widget.id);
    initPrefs();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _mainViewModel = Provider.of<MainViewModel>(context);
    webtoon = _mainViewModel.getWebtoonDetail(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: onHeartTap,
            icon: Icon(
                isLiked ? Icons.favorite : Icons.favorite_outline_outlined
            ),
          )
        ],
        title: Text(
          widget.title,
          style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: widget.id,
                    child: Container(
                      width: 300,
                      height: 200,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 15,
                            offset: const Offset(10, 10),
                            color: Colors.black.withOpacity(0.3),
                          )
                        ],
                      ),
                      child: Image.network(
                        widget.thumb,
                        headers: const {
                          'Referer': 'https://comic.naver.com',
                        },
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25,),
              FutureBuilder(
                  future: webtoon,
                  builder: (context, snapshot) {
                    if(snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data!.about,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 15,),
                          Text(
                            ("${snapshot.data!.genre} / ${snapshot.data!.age}"),
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      );
                    }
                    return const Text("...");
                  }
              ),
              const SizedBox(height: 25,),
              FutureBuilder(
                future: episodes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return makeEpisodeList(snapshot);
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  ListView makeEpisodeList(AsyncSnapshot<List<WebtoonEpisode>> snapshot) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var episode = snapshot.data![index];
        return EpisodeItem(
          webtoonId: widget.id,
          episode: episode,
        );
      },
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
