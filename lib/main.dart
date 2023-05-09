// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';

import '../screens/add.dart';
import '../screens/splash.dart';
import '../screens/login.dart';
import '../screens/switch.dart';
import '../screens/home.dart';
import '../screens/search.dart';
import '../screens/activity.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.white,
    //   statusBarBrightness: Brightness.dark,
    // ));
    return MaterialApp(
      // MaterialApp Banner
      debugShowCheckedModeBanner: false,

      // MaterialApp Theme
      theme: ThemeData(
        textTheme: GoogleFonts.outfitTextTheme(
          Theme.of(context).textTheme,
        ),
        brightness: Brightness.light,

        // Button Styles
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 18),
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(15),
            // ),
            // minimumSize: Size(128, 46),
            backgroundColor: Color(0xFFE5383B),
            foregroundColor: Color(0xFF14151C),

            // Test Styles
            textStyle: GoogleFonts.outfit(
              textStyle: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),

      // MaterialApp Home
      home: AddPost(),
    );
  }
}
