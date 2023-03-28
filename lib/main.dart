// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/splash.dart';
import '../screens/login.dart';
import '../screens/switch.dart';
import '../screens/home.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // MaterialApp Banner
      debugShowCheckedModeBanner: false,

      // MaterialApp Theme
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            minimumSize: Size(128, 46),
            backgroundColor: Color(0xFF5263FC),
            foregroundColor: Color(0xFF14151C),
            textStyle: GoogleFonts.outfit(
              textStyle: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),

      // MaterialApp Home
      home: SplashScreen(),
    );
  }
}
