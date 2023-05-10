import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/style.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: MyColors.primery,
        image: DecorationImage(
          repeat: ImageRepeat.repeat,
          image: AssetImage('assets/basics/pattern.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Center(
              child: SvgPicture.asset('assets/basics/logo-mono.svg'),
            ),
            Positioned(
              bottom: 41,
              child: Column(
                children: [
                  Text(
                    'by',
                    style: GoogleFonts.outfit(
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: MyColors.black,
                      ),
                    ),
                  ),
                  Text(
                    'KylixDev',
                    style: GoogleFonts.outfit(
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: MyColors.white,
                      ),
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