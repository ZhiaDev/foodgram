import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SwitchAccountScreen extends StatelessWidget {
  const SwitchAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF14151C),
      body: Stack(
        children: [
          // background and sign in & sign up
          backgroundAndSigninSignup(),
          // SwitchUser Box
          userBox(context),
        ],
      ),
    );
  }

  Widget backgroundAndSigninSignup() {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/switch_account/background_picture.png',
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 132, bottom: 64),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don’t have an account? / ',
                style: GoogleFonts.outfit(
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFFFFFF).withOpacity(0.6),
                  ),
                ),
              ),
              Text(
                'Sign up',
                style: GoogleFonts.outfit(
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        )
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
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(159, 158, 159, 0.5),
                        Color.fromRGBO(159, 158, 159, 0.2)
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
                            'assets/images/switch_account/avatar.png',
                          ),
                          height: 130,
                        ),
                      ),
                      SizedBox(height: 20),

                      // Name Of User
                      Text(
                        'Parsa Sharifi',
                        style: GoogleFonts.outfit(
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      // Button: Confrim and Switch Account
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Confirm',
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
                                  backgroundColor:
                                      Color(0xFF5263FC).withOpacity(0.4),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'switch account',
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
