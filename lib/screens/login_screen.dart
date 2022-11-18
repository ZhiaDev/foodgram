import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF323A99), Color(0xFF5263FC)])),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          _getImageContainer(),
          _getContainerBox(),
        ],
      ),
    ));
  }

  Widget _getContainerBox() {
    return Column(
      children: [
        Expanded(child: Container()),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF14151C),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(36),
                topRight: Radius.circular(36),
              ),
            ),
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
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      labelText: '  Email ',
                      labelStyle: TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'Gilroy-medium'),
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
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      labelText: '  Password ',
                      labelStyle: TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'Gilroy-medium'),
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
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _getImageContainer() {
    return Column(
      children: [
        // SizedBox(height: 48),
        Expanded(
          flex: 55,
          child: Image.asset('assets/images/login_screen/rocket.png'),
        ),
        Expanded(
          flex: 45,
          child: Container(),
        )
      ],
    );
  }
}
