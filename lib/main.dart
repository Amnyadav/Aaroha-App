import 'dart:io';

import 'package:aaroha/firebase_options.dart';
import 'package:aaroha/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pages/animation.dart'; 
import 'package:aaroha/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid?
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCeiWgJpobn6Gmk1tRzir-MageHsKlO6oc",
        appId: "1:55283264807:android:ddf7cf394f77bdae5f0d02",
        messagingSenderId: "55283264807",
        projectId: "aaroha-application",)
  )
      :await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      },
      // home: const AnimationScreen(),
    );
  }
}
