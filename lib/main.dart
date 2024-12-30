import 'package:aaroha/pages/home.dart';
import 'package:flutter/material.dart';
import 'pages/animation.dart'; 
import 'package:aaroha/theme/theme.dart';
import 'pages/chapters.dart'; 
import 'pages/team.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/":(context) => AnimationScreen(),
        "/pages/home":(context) => MyHomePage(title: "titel",),
         "/pages/chapters":(context) =>ChaptersPage(),
        "/pages/team":(context) => TeamPage(),
      },
      // home: const AnimationScreen(),
    );
  }
}
