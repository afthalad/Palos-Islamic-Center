import 'package:al_sahabah/screens/drawerpagescreen.dart';
import 'package:al_sahabah/screens/featuresscreen.dart';
import 'package:al_sahabah/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      initialRoute: '/home_screen',
      routes: {
        '/home_screen': (context) => const HomeScreen(),
      },
    );
  }
}
