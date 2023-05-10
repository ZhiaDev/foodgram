import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/style.dart';

class SwitchAccountScreen extends StatelessWidget {
  const SwitchAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primery,
      body: Stack(
        children: [
          // background and sign in & sign up
          backgroundAndSigninSignup(context),
          // SwitchUser Box
          userBox(context),
        ],
      ),
    );
  }

  Widget backgroundAndSigninSignup(context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/basics/switch-bg.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget userBox(context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Center(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white.withOpacity(0.4),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(36.8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(36),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 32.0,
                  sigmaY: 32.0,
                ),
                child: Container(
                  height: 352,
                  width: 340,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36),
                    gradient: LinearGradient(
                      end: Alignment.bottomRight,
                      begin: Alignment.topLeft,
                      colors: [
                        MyColors.grey4.withOpacity(0.3),
                        MyColors.grey4.withOpacity(0.1),
                        MyColors.grey4.withOpacity(0.3),
                      ],
                    ),
                  ),

                  // Box Content
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Avatar Picture
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image(
                          image: AssetImage(
                            'assets/avatars/user-1.jpg',
                          ),
                          height: 130,
                        ),
                      ),
                      SizedBox(height: 20),

                      // Name Of User
                      Text(
                        'Katrina Bartell',
                        style: GoogleFonts.outfit(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),

                      // Button: Confrim and Switch Account
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: MyColors.grey3,
                                  side: BorderSide(
                                    color: Color(0xFFC5C5C5),
                                    width: 1.5,
                                  ),
                                  minimumSize: Size(100, 46),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Switch account',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  foregroundColor: MyColors.grey3,
                                  minimumSize: Size(100, 46),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Confirm',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // End Column
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
