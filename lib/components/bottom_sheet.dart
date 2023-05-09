import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodgram/utils/style.dart';
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
                // Color(0xFF656565).withOpacity(0.2),
                // Color(0xFF656565).withOpacity(0.4),
                // Color(0xFF656565).withOpacity(0.2),
                MyColors.grey4.withOpacity(0.6),
                MyColors.grey4.withOpacity(0.5),
                MyColors.grey4.withOpacity(0.6),
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
                      color: MyColors.black,
                    ),
                  ),
                  // Share Text & Icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Share',
                        style: GoogleFonts.outfit(
                          textStyle: TextStyle(
                            color: MyColors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/send.svg',
                        colorFilter: ColorFilter.mode(
                          MyColors.black,
                          BlendMode.srcIn,
                        ),
                        height: 24,
                      ),
                    ],
                  ),
                  // Search Filed
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 32),
                    height: 46,
                    decoration: BoxDecoration(
                      color: MyColors.white.withOpacity(0.7),
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
                            colorFilter: ColorFilter.mode(
                              MyColors.black,
                              BlendMode.srcIn,
                            ),
                            height: 24,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              style: TextStyle(
                                color: MyColors.black,
                              ),
                              cursorColor: MyColors.black,
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
                childCount: 12,
                (context, index) {
                  return _getShareProfiles(index);
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
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 20,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                minimumSize: Size(128, 46),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
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

  Widget _getShareProfiles(index) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Container(
            color: MyColors.black,
            width: 64,
            // ! HardCode: ProfilePicture
            child: Image.asset('assets/avatars/user-$index.jpg'),
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
                color: MyColors.black,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
