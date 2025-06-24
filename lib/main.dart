import 'package:flutter/material.dart';
import 'package:leloquiz/presentation/screens/splash_screen.dart';

import 'presentation/home/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Biblique',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
      home: SplashScreen(page: HomeScreen(), second: 5),
      debugShowCheckedModeBanner: false,
    );
  }
}
