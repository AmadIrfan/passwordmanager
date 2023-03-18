import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:passwordmanager/windows/home_page.dart';

import '../windows/login.dart';
import '../styles/properties.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      FirebaseAuth user = FirebaseAuth.instance;
      if (user.currentUser == null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LogIn(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mode = MediaQuery.of(context).orientation == Orientation.landscape;
    final size = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.greenAccent.withOpacity(0.5),
              Colors.amberAccent.withOpacity(0.5),
              Colors.blue.withOpacity(0.7),
              Colors.blueAccent.withOpacity(0.6),
              Colors.amberAccent.withOpacity(0.5),
              Colors.greenAccent.withOpacity(0.5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: mode ? size * 0.26 : size * 0.4,
              ),
              const Icon(
                Icons.lock_open,
                size: 100,
              ),
              SizedBox(
                height: mode ? size * 0.03 : size * 0.02,
              ),
              SizedBox(
                height: mode ? size * 0.3 : size * 0.4,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                      child: Text(
                        'Password ',
                        style: style,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: AnimatedTextKit(
                        totalRepeatCount: 1012,
                        isRepeatingAnimation: true,
                        displayFullTextOnTap: true,
                        animatedTexts: [
                          RotateAnimatedText(
                            'Manager',
                            textStyle: aniStyle,
                          ),
                          RotateAnimatedText(
                            'Generator',
                            textStyle: aniStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
