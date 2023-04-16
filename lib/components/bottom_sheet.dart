import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ShareBottemSheet extends StatelessWidget {
  const ShareBottemSheet({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(36.0),
        topRight: Radius.circular(36.0),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 32.0, sigmaY: 32.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF656565).withOpacity(0.2),
                Color(0xFF656565).withOpacity(0.4),
                Color(0xFF656565).withOpacity(0.2),
              ],
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 38),
          child: _getContent(context),
        ),
      ),
    );
  }

  Widget _getContent(context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  // Sheet Grabber
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 22),
                    height: 5,
                    width: 64,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white),
                  ),
                  // Share Text & Icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Share',
                        style: GoogleFonts.outfit(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/send.svg',
                        height: 24,
                      ),
                    ],
                  ),
                  // Search Filed
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 32),
                    height: 46,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
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
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: 30,
                (context, index) {
                  return _getShareProfiles();
                },
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 28,
                mainAxisSpacing: 10,
                mainAxisExtent: 96,
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(bottom: 100),
            ),
          ],
        ),
        Positioned(
          bottom: 48,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 20,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Send',
                style: GoogleFonts.outfit(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _getShareProfiles() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Container(
            color: Colors.grey[400],
            height: 64,
            width: 64,
            // ! HardCode: ProfilePicture
            child: Image.asset('assets/avatars/user-32789.jpg'),
          ),
        ),
        SizedBox(height: 6),
        Container(
          width: 48,
          child: Text(
            'KylixDev',
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.outfit(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
