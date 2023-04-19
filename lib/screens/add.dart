import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AddPost extends StatelessWidget {
  const AddPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF14151C),
      appBar: AppBar(
        backgroundColor: Color(0xFF14151C),
        centerTitle: false,
        elevation: 0,
        title: Row(
          children: [
            Text(
              'Post',
              style: GoogleFonts.outfit(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(width: 6),
            SvgPicture.asset(
              'assets/icons/arrowdown.svg',
              height: 24,
            ),
            Spacer(),
            Text(
              'Next',
              style: GoogleFonts.outfit(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(width: 8),
            SvgPicture.asset(
              'assets/icons/arrowsquareright.svg',
              height: 24,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              _selectedImage(context),
            ],
          ),
        ),
      ),
    );
  }

  Container _selectedImage(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: AssetImage('assets/posts/post-12.png'), fit: BoxFit.cover),
      ),
      height: MediaQuery.of(context).size.width / 1.081,
      width: MediaQuery.of(context).size.width / 1.081,
    );
  }
}
