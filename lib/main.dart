
import 'dart:io';

import 'package:aaroha/firebase_options.dart';
import 'package:aaroha/pages/chapters.dart';
import 'package:aaroha/pages/home.dart';
import 'package:aaroha/pages/team.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'pages/animation.dart';
import 'package:aaroha/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  // await Firebase.initializeApp(
  //   options: Platform.isAndroid
  //       ? FirebaseOptions(
  //     apiKey: dotenv.env['API_KEY']!,
  //     appId: dotenv.env['APP_ID']!,
  //     messagingSenderId: dotenv.env['MESSAGING_SENDER_ID']!,
  //     projectId: dotenv.env['PROJECT_ID']!,
  //   )
  //       : DefaultFirebaseOptions.currentPlatform,
  // );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth auth = FirebaseAuth.instance;
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
        "/": (context) => AnimationScreen(),
        "/pages/home": (context) => MyHomePage(title: "titel"),
        "/pages/chapters": (context)=>ChaptersPage(),
        "pages/team": (context)=>TeamPage(),
      },
    );
  }
}
