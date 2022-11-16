import 'dart:ui';

import 'package:flutter/material.dart';

class SwitchAccountScreen extends StatelessWidget {
  const SwitchAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF14151C),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'images/switch_account/background_picture.png'),
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
                      style: TextStyle(
                        color: Color(0xFF898A8D),
                      ),
                    ),
                    Text(
                      'Sign up',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),

          // Blur Box
          Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Center(
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
                      child: Column(
                        children: [
                          SizedBox(height: 32),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Image(
                              image: AssetImage(
                                'images/switch_account/avatar.png',
                              ),
                              height: 128,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Parsa Sharifi',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 22),
                          TextButton(
                            style: TextButton.styleFrom(
                              shape: StadiumBorder(),
                              minimumSize: Size(129, 46),
                              backgroundColor: Color(0xFF5263FC),
                              foregroundColor: Color(0xFF14151C),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Confirm',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          TextButton(
                            style: TextButton.styleFrom(
                              shape: StadiumBorder(),
                              minimumSize: Size(180, 46),
                              foregroundColor: Color(0xFF14151C),
                            ),
                            onPressed: () {},
                            child: Text(
                              'switch account',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}