import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode1.addListener(() {
      setState(() {});
    });
    super.initState();
    focusNode2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        // Background gradient
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF323A99), Color(0xFF5263FC)],
          ),
        ),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            _getImageBackground(), // rocket background
            _getLoginContainer(),
          ],
        ),
      ),
    );
  }

  Widget _getImageBackground() {
    return Stack(
      children: [
        Image.asset('assets/basics/rocket.png'),
        Container()
      ],
    );
  }

  Widget _getLoginContainer() {
    return Column(
      children: [
        Expanded(
          flex: 45,
          child: Container(),
        ),
        Expanded(
          flex: 53,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF14151C),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(36),
                topRight: Radius.circular(36),
              ),
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                SizedBox(height: double.maxFinite),
                SizedBox(width: double.infinity),

                // Sign in Text and Logo
                Positioned(
                  top: 42,
                  child: SizedBox(
                    height: 32,
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sign in to ',
                            style: GoogleFonts.outfit(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/basics/logo-secondary.svg',
                            height: 25,
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                // Email Field
                Positioned(
                  top: 106,
                  child: SizedBox(
                    height: 46,
                    width: 330,
                    child: TextField(
                      cursorColor: Color(0xFF5263FC),
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      focusNode: focusNode1,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        labelText: ' Email',
                        labelStyle: TextStyle(
                          color: focusNode1.hasFocus
                              ? Color(0xFF5263FC)
                              : Color(0xFFFFFFFF),
                          fontSize: 15,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Color(0xFFC5C5C5),
                            width: 3,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Color(0xFF5263FC),
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Password Field
                Positioned(
                  top: 184,
                  child: SizedBox(
                    height: 46,
                    width: 330,
                    child: TextField(
                      cursorColor: Color(0xFF5263FC),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      focusNode: focusNode2,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        labelText: ' Password',
                        labelStyle: TextStyle(
                          color: focusNode2.hasFocus
                              ? Color(0xFF5263FC)
                              : Color(0xFFFFFFFF),
                          fontSize: 15,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Color(0xFFC5C5C5),
                            width: 3,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Color(0xFF5263FC),
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Sign in Button
                Positioned(
                  top: 262,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sign in',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                // Sign up Button
                Positioned(
                  top: 400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 24,
                          width: 183,
                          child: Center(
                            child: Text(
                              'Don’t have an account? / ',
                              style: GoogleFonts.outfit(
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFFFFFFF).withOpacity(0.6),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 24,
                          width: 60,
                          child: Center(
                            child: Text(
                              'Sign up',
                              style: GoogleFonts.outfit(
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    super.dispose();
  }
}
