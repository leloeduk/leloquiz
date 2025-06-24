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
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.blue.shade800,
          onPrimary: Colors.blue.shade300,
          secondary: Colors.green.shade800,
          onSecondary: Colors.green.shade300,
          error: Colors.red.shade800,
          onError: Colors.red.shade300,
          surface: Colors.grey,
          onSurface: Colors.grey.shade900,
        ),
        scaffoldBackgroundColor: Colors.grey.shade300,
        fontFamily: 'Roboto',
      ),
      title: 'Quiz Biblique',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
      home: SplashScreen(page: HomeScreen(), second: 5),
      debugShowCheckedModeBanner: false,
    );
  }
}
