import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginCheck extends StatefulWidget {
  const LoginCheck({super.key});

  @override
  State<LoginCheck> createState() => _LoginCheckState();
}

class _LoginCheckState extends State<LoginCheck> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> checkCurrentUser(BuildContext context) async {
    final User? googleUser = _auth.currentUser;
    if (googleUser != null) {
      Timer(const Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, "main");
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, "login");
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    checkCurrentUser(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var responsive = MediaQuery.of(context);
    return Scaffold(
      body: Container(
          height: responsive.size.height,
          width: responsive.size.width,
          decoration: const BoxDecoration(color: Colors.black),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedContainer(
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(seconds: 3),
                  child: Image.asset("assets/logo.png")),
              const SizedBox(height: 12),
              Text(
                "FANME",
                style: GoogleFonts.kanit(
                    color: Colors.white,
                    fontSize: 90,
                    fontWeight: FontWeight.bold),
              )
              // const SpinKitSpinningLines(size: 100, itemCount: 8 ,color: Colors.white as Color)
              // const SpinKitCircle(color: Colors.white, size: 50),
            ],
          )),
    );
  }
}
