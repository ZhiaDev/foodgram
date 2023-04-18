import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF14151C),
      body: SafeArea(
        child: Column(
          children: [
            _getSearchBox(),
            _getCategories(context),
          ],
        ),
      ),
    );
  }

  Widget _getSearchBox() {
    return Container(
      margin: EdgeInsets.only(right: 16, left: 16, top: 8),
      height: 46,
      decoration: BoxDecoration(
        color: Color(0xFF202232),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 4,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/search.svg',
              height: 24,
            ),
            SizedBox(width: 8),
            Expanded(
              child: TextField(
                style: TextStyle(
                  color: Colors.white,
                ),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            SizedBox(width: 14),
            SvgPicture.asset(
              'assets/icons/scan.svg',
              height: 24,
            ),
          ],
        ),
      ),
    );
  }

  Widget _getCategories(context) {
    return Container(
      height: 28,
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 12, // ! hc
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 16,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              color: Color(0xFF202232),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'category k.$index',
                  style: GoogleFonts.outfit(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  
}
