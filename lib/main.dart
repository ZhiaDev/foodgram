import 'package:flutter/material.dart';
import '../screens/switch_account.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
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
          image: AssetImage('images/splash_screen/pattern.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Center(
              child: Image(
                image: AssetImage('images/splash_screen/logo.png'),
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
