import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF14151C),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(17),
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              border: Border.all(color: Colors.white, width: 2)
            ),
            child: SvgPicture.asset('assets/images/home_screen/plus.svg'),
          ),
        ),
      ),
    );
  }
}
