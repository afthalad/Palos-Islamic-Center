import 'dart:async';

import 'package:al_sahabah/const/const.dart';
import 'package:al_sahabah/screens/homescreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(
        Duration(milliseconds: 5000),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBarColor.withOpacity(0.3),
      body: Center(
        // child: Text("aasdsd"),
        child: Container(
            width: 200,
            height: 200,
            child: Image(
                fit: BoxFit.contain,
                image: AssetImage("images/full_logo.png"))),
      ),
    );
  }
}
