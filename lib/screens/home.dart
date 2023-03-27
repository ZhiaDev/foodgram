import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF14151C),
      appBar: AppBar(
        backgroundColor: Color(0xFF14151C),
        centerTitle: false,
        title: SvgPicture.asset(
          'assets/images/home_screen/logo.svg',
          height: 32,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              'assets/images/home_screen/icn_direct.svg',
              height: 24,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Center(child: _storyContainer()),
      ),
    );
  }

  Widget _storyContainer() {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(18),
      padding: EdgeInsets.all(3.5),
      strokeWidth: 2,
      dashPattern: [13, 1],
      color: Color(0xFF5263FC),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: Container(
          height: 56,
          width: 56,
          child: Image.asset('assets/images/switch_account/avatar.png'),
        ),
      ),
    );
  }

  Widget _addStory() {
    return Container(
      padding: EdgeInsets.all(17),
      width: 64,
      height: 64,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white, width: 2)),
      child: SvgPicture.asset('assets/images/home_screen/plus.svg'),
    );
  }
}
