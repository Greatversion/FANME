// import 'package:device_apps/device_apps.dart';

import 'package:apptex_chat/apptex_chat.dart';

import 'package:fanme/Frontend/allApps.dart';
import 'package:fanme/Frontend/allCommunities.dart';
import 'package:fanme/Frontend/feedback.dart';
import 'package:fanme/Frontend/loginCheck.dart';
import 'package:fanme/Frontend/mainScreen.dart';

import 'package:fanme/loginScreen.dart';
// import 'package:fanme/Frontend/screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recently Launched App',
      home: const LoginCheck(),
      routes: {
        "login": (context) => const SignInScreen(),
        "allAppList": (context) => const AllDeviceApps(),
        "main": (context) => const MainScreen(),
        "community": (context) => const CommunityPage(),
        "feedback": (context) => const FeedbackForm(),
        // "settings": (context) => const SettingScreen(),
      },
    );
  }
}
