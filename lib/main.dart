//
// import 'dart:io';
//
// import 'package:aaroha/firebase_options.dart';
// import 'package:aaroha/pages/chapters.dart';
// import 'package:aaroha/pages/home.dart';
// import 'package:aaroha/pages/team.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'pages/animation.dart';
// import 'package:aaroha/theme/theme.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await dotenv.load(fileName: ".env");
//
//   // await Firebase.initializeApp(
//   //   options: Platform.isAndroid
//   //       ? FirebaseOptions(
//   //     apiKey: dotenv.env['API_KEY']!,
//   //     appId: dotenv.env['APP_ID']!,
//   //     messagingSenderId: dotenv.env['MESSAGING_SENDER_ID']!,
//   //     projectId: dotenv.env['PROJECT_ID']!,
//   //   )
//   //       : DefaultFirebaseOptions.currentPlatform,
//   // );
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   await requestNotificationPermission();
//   FirebaseAuth auth = FirebaseAuth.instance;
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: lightMode,
//       debugShowCheckedModeBanner: false,
//       initialRoute: "/",
//       routes: {
//         "/": (context) => AnimationScreen(),
//         "/pages/home": (context) => MyHomePage(title: "titel"),
//         "/pages/chapters": (context)=>ChaptersPage(),
//         "pages/team": (context)=>TeamPage(),
//       },
//     );
//   }
// }
//
//
//
// Future<void> requestNotificationPermission() async {
//    FirebaseMessaging messaging = FirebaseMessaging.instance;
//
//   NotificationSettings settings = await messaging.requestPermission(
//     alert: true,
//     badge: true,
//     sound: true,
//   );
//
//   if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//
//     print('User granted permission');
//   } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
//     print('User denied permission');
//   }
// }
//
//
// Future<void> saveDeviceToken() async {
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//
//   // Get the device token
//   String? token = await messaging.getToken();
//
//   if (token != null) {
//     print("Device token: $token");
//
//     // Save the token in Firestore
//     await FirebaseFirestore.instance.collection('deviceTokens').doc(token).set({
//       'token': token,
//       'createdAt': FieldValue.serverTimestamp(),
//     });
//   }
// }


import 'dart:io';

import 'package:aaroha/firebase_options.dart';
import 'package:aaroha/pages/chapters.dart';
import 'package:aaroha/pages/home.dart';
import 'package:aaroha/pages/team.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'pages/animation.dart';
import 'package:aaroha/theme/theme.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Handle background messages
  print("Background Message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Request Notification Permission
  await requestNotificationPermission();

  // Configure background notification handler
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  FirebaseAuth auth = FirebaseAuth.instance;

  // Save device token
  await saveDeviceToken();

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
        "/pages/chapters": (context) => ChaptersPage(),
        "pages/team": (context) => TeamPage(),

      },
    );
  }
}

Future<void> requestNotificationPermission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted notification permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
    print('User denied notification permission');
  }
}

Future<void> saveDeviceToken() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // Get the device token
  String? token = await messaging.getToken();

  if (token != null) {
    print("Device token: $token");

    // Save the token in Firestore
    await FirebaseFirestore.instance.collection('deviceTokens').doc(token).set({
      'token': token,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  // Listen for token refresh
  FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
    print("Token refreshed: $newToken");
    await FirebaseFirestore.instance.collection('deviceTokens').doc(newToken).set({
      'token': newToken,
      'createdAt': FieldValue.serverTimestamp(),
    });
  });
}

void configureForegroundNotificationHandling() {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (message.notification != null) {
      print('Foreground Notification Title: ${message.notification!.title}');
      print('Foreground Notification Body: ${message.notification!.body}');
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('Notification Clicked! Data: ${message.data}');
  });
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    configureForegroundNotificationHandling();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text('Welcome to Aaroha App'),
      ),
    );
  }
}
