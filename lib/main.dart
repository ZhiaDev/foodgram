// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import '../screens/home.dart';
import '../screens/login.dart';
import '../screens/switch.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            minimumSize: Size(128, 46),
            backgroundColor: Color(0xFF5263FC),
            foregroundColor: Color(0xFF14151C),
            textStyle: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontFamily: 'Gilroy-bold',
            ),
          ),
        ),
      ),
      //
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF14151C),
        image: DecorationImage(
          repeat: ImageRepeat.repeat,
          image: AssetImage('assets/images/splash_screen/pattern.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Center(
              child: Image(
                image: AssetImage('assets/images/splash_screen/logo.png'),
              ),
            ),
            Positioned(
              bottom: 41,
              child: Column(
                children: [
                  Text(
                    'From',
                    style: TextStyle(
                      color: Color(0xFF7A7A7D),
                      fontFamily: 'Gilroy-bold',
                    ),
                  ),
                  Text(
                    'Cafe Flutter',
                    style: TextStyle(
                      color: Color(0xFF5263FC),
                      fontFamily: 'Gilroy-bold',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
