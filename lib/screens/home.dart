import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/bottom_sheet.dart';
import '../utils/style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        centerTitle: false,
        elevation: 0,
        title: SvgPicture.asset(
          'assets/basics/logo-primery.svg',
          height: 32,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              'assets/icons/direct.svg',
              colorFilter: ColorFilter.mode(MyColors.black, BlendMode.srcIn),
              height: 24,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [_getStories(), _getPosts()],
        ),
      ),
    );
  }

  Future<dynamic> _openShareBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      barrierColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.2,
            maxChildSize: 0.7,
            builder: (context, scrollController) {
              return ShareBottemSheet(
                scrollController: scrollController,
              );
            },
          ),
        );
      },
    );
  }

  Widget _getStories() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 112,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 9,
          itemBuilder: (BuildContext context, int index) {
            return index == 0 ? _addStory() : story(index);
          },
        ),
      ),
    );
  }

  Widget _getPosts() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        // ! HardCode: Posts Count
        childCount: 10,
        (context, index) {
          return post(context, index);
        },
      ),
    );
  }

  Widget post(context, index) {
    return Column(
      children: [
        SizedBox(height: 32),
        // Posts Owner
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.09,
          child: Row(
            children: [
              // Profile of the owner of the post
              // ! HardCode: UserProfile Picture
              DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(12),
                padding: EdgeInsets.all(3.5),
                strokeWidth: 2,
                dashPattern: [13, 1],
                color: MyColors.primery,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Container(
                    height: 36,
                    width: 36, // 56 for story
                    child: Image.asset('assets/avatars/user-$index.jpg'),
                  ),
                ),
              ),
              SizedBox(width: 10),
              // Name and location of the owner of the post
              // ! HardCode: UserName & Location
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sidney_Davis',
                    style: GoogleFonts.outfit(
                      textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: MyColors.black,
                      ),
                    ),
                  ),
                  Text(
                    'Yogurt and orange',
                    style: GoogleFonts.outfit(
                      textStyle: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: MyColors.grey1,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              // todo: MoreButton Function
              GestureDetector(
                child: Icon(
                  Icons.more_vert,
                  color: MyColors.black,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        // Post
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: MediaQuery.of(context).size.width / 1.081 + 21,
              width: MediaQuery.of(context).size.width / 1.081,
            ),
            // ! HardCode: PostPicture
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                    image: AssetImage('assets/posts/post-${index + 2}.png'),
                    fit: BoxFit.cover),
              ),
              height: MediaQuery.of(context).size.width / 1.081,
              width: MediaQuery.of(context).size.width / 1.081,
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 42,
                width: MediaQuery.of(context).size.width / 1.176,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 32.0,
                      sigmaY: 32.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            // Color(0xFF656565).withOpacity(0.2),
                            // Color(0xFF656565).withOpacity(0.5),
                            // Color(0xFF656565).withOpacity(0.2),
                            MyColors.white.withOpacity(0.6),
                            MyColors.white.withOpacity(0.5),
                            MyColors.white.withOpacity(0.6),
                          ],
                        ),
                      ),
                      // ! HardCode: Like, Comment, Share, Save
                      // todo: Like, Comment, Share, Save Function
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 26),
                              SvgPicture.asset(
                                'assets/icons/like.svg',
                                colorFilter: ColorFilter.mode(
                                  MyColors.black,
                                  BlendMode.srcIn,
                                ),
                              ),
                              SizedBox(width: 6),
                              Text(
                                '3.2K',
                                style: GoogleFonts.outfit(
                                  textStyle: TextStyle(
                                    color: MyColors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/comment.svg',
                                colorFilter: ColorFilter.mode(
                                  MyColors.black,
                                  BlendMode.srcIn,
                                ),
                              ),
                              SizedBox(width: 6),
                              Text(
                                '1.4K',
                                style: GoogleFonts.outfit(
                                  textStyle: TextStyle(
                                    color: MyColors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              )
                            ],
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Material(
                              color: Colors.transparent,
                              child: Container(
                                height: 32,
                                width: 32,
                                child: InkWell(
                                  child: SvgPicture.asset(
                                    'assets/icons/share.svg',
                                    colorFilter: ColorFilter.mode(
                                      MyColors.black,
                                      BlendMode.srcIn,
                                    ),
                                    width: 24,
                                    height: 24,
                                    fit: BoxFit.scaleDown,
                                  ),
                                  onTap: () => _openShareBottomSheet(context),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/save.svg',
                                colorFilter: ColorFilter.mode(
                                  MyColors.black,
                                  BlendMode.srcIn,
                                ),
                              ),
                              SizedBox(width: 26),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget story(index) {
    // ! HardCode: Stories
    return Container(
      // padding: EdgeInsets.all(8),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(18),
            padding: EdgeInsets.all(3.5),
            strokeWidth: 2,
            dashPattern: [13, 1],
            color: MyColors.primery,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(18 - 3)),
              child: Container(
                height: 56,
                width: 56, // 36 for story
                // ! HardCode: ProfilePicture
                child: Image.asset('assets/avatars/user-${index + 3}.jpg'),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'KylixDev',
            style: GoogleFonts.outfit(
              textStyle: TextStyle(
                color: MyColors.black,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _addStory() {
    // todo: AddStory Function
    return Container(
      padding: EdgeInsets.only(top: 12, bottom: 12, right: 8, left: 12),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: MyColors.black, width: 2),
            ),
            child: SvgPicture.asset(
              'assets/icons/plus.svg',
              colorFilter: ColorFilter.mode(
                MyColors.primery,
                BlendMode.srcIn,
              ),
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Your Story',
            style: GoogleFonts.outfit(
              textStyle: TextStyle(
                color: MyColors.black,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
