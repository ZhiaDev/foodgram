import 'package:flutter/material.dart';

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
        Image.asset('assets/images/login_screen/rocket.png'),
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(width: double.infinity),
                  SizedBox(height: 50),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign in to ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Gilroy-bold'),
                      ),
                      Image.asset('assets/images/login_screen/logo.png')
                    ],
                  ),
                  SizedBox(height: 38),
                  SizedBox(
                    height: 46,
                    width: 330,
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Gilroy-medium',
                          fontSize: 15),
                      focusNode: focusNode1,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        labelText: '  Email ',
                        labelStyle: TextStyle(
                          color: focusNode1.hasFocus
                              ? Color(0xFF5263FC)
                              : Color(0xFFFFFFFF),
                          fontSize: 15,
                          fontFamily: 'Gilroy-medium',
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
                  SizedBox(height: 32),
                  SizedBox(
                    height: 46,
                    width: 330,
                    child: TextField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Gilroy-medium',
                        fontSize: 15,
                      ),
                      focusNode: focusNode2,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        labelText: '  Password ',
                        labelStyle: TextStyle(
                          color: focusNode2.hasFocus
                              ? Color(0xFF5263FC)
                              : Color(0xFFFFFFFF),
                          fontSize: 15,
                          fontFamily: 'Gilroy-medium',
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
                  SizedBox(height: 32),
                  TextButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(
                        'Sign in',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account? / ',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Gilroy-bold',
                          color: Color(0xFF898A8D),
                        ),
                      ),
                      Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Gilroy-bold',
                          color: Color(0xFFFFFFFF),
                        ),
                      )
                    ],
                  ),
                ],
              ),
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
