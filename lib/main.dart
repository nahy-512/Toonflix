import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toonflix/screens/home_screen.dart';
import 'package:toonflix/screens/main_viewmodel.dart';

void main() {
  runApp(ChangeNotifierProvider( // 단일 Provider 정의
    create: (_) => MainViewModel(),
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: HomeScreen()
    );
  }
}