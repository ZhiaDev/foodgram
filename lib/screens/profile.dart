import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/style.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: ((context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16, top: 18),
                    child: Icon(Icons.menu),
                  )
                ],
                bottom: PreferredSize(
                  child: Container(
                    height: 16,
                    decoration: BoxDecoration(
                      color: MyColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                  ),
                  preferredSize: Size.fromHeight(10),
                ),
                systemOverlayStyle: SystemUiOverlayStyle.dark,
                expandedHeight: 120,
                backgroundColor: MyColors.white,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      Image.asset(
                        'assets/posts/post-4.png',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        color: MyColors.red3.withOpacity(0.5),
                        height: double.infinity,
                        width: double.infinity,
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: getProfileHeader(),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
                  child: Text(
                    'Passionate foodie and midlevel chef, creating culinary art one dish at a time 🍴👨‍🍳',
                    style: GoogleFonts.outfit(
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 16),
                        SvgPicture.asset(
                          'assets/icons/link-variant.svg',
                          height: 24,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'link.co/katrib',
                          style: GoogleFonts.outfit(
                            textStyle: TextStyle(
                              fontSize: 15,
                              color: MyColors.link,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: 16),
                        Icon(Icons.location_on_sharp, color: MyColors.grey1),
                        SizedBox(width: 4),
                        Text(
                          'Berlin, Germany',
                          style: GoogleFonts.outfit(
                            textStyle: TextStyle(
                              fontSize: 15,
                              color: MyColors.grey1,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            foregroundColor: MyColors.grey3,
                            minimumSize: Size(100, 46),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Follow',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            backgroundColor: Colors.transparent,
                            foregroundColor: MyColors.grey3,
                            side: BorderSide(
                              color: Color(0xFFC5C5C5),
                              width: 1.5,
                            ),
                            minimumSize: Size(100, 46),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Message',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _getStories(),
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: TabBarViewDelegate(
                  TabBar(
                    labelStyle: GoogleFonts.outfit(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: MyColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    indicatorColor: MyColors.primery,
                    labelColor: Colors.black,
                    indicatorPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    tabs: [
                      Tab(
                        icon: SvgPicture.asset(
                          'assets/icons/gallery.svg',
                          height: 22,
                        ),
                      ),
                      Tab(
                        icon: SvgPicture.asset(
                          'assets/icons/save-2.svg',
                          height: 22,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          }),
          body: TabBarView(children: [
            CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(12, 20, 12, 20),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Container(
                          child: ClipRRect(
                            child: Image.asset(
                              'assets/posts/post-$index.png',
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFF202232),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        );
                      },
                      childCount: 24,
                    ),
                    gridDelegate: SliverQuiltedGridDelegate(
                      crossAxisCount: 3,
                      mainAxisSpacing: 6,
                      crossAxisSpacing: 6,
                      pattern: [
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(2, 2),
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(1, 1),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(12, 20, 12, 20),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Container(
                          child: ClipRRect(
                            child: Image.asset(
                              'assets/posts/post-${index + 5}.png',
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFF202232),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        );
                      },
                      childCount: 19,
                    ),
                    gridDelegate: SliverQuiltedGridDelegate(
                      crossAxisCount: 3,
                      mainAxisSpacing: 6,
                      crossAxisSpacing: 6,
                      pattern: [
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(2, 2),
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(1, 1),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Widget getProfileHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 2, left: 16, right: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Profile Picture
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
                    height: 64,
                    width: 64,
                    // ! HardCode: ProfilePicture
                    child: Image.asset('assets/avatars/user-1.jpg'),
                  ),
                ),
              ),
              SizedBox(width: 10),
              // Names
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Katrina Bartell',
                    style: GoogleFonts.outfit(
                      textStyle: TextStyle(
                        fontSize: 18,
                        color: MyColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    'kartina_bartell32',
                    style: GoogleFonts.outfit(
                      textStyle: TextStyle(
                        fontSize: 14,
                        color: MyColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          SvgPicture.asset(
            'assets/icons/edit.svg',
            height: 24,
          ),
        ],
      ),
    );
  }

  Widget _getStories() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 112,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return index == 0 ? _addStory() : story(index);
          },
        ),
      ),
    );
  }

  Widget story(index) {
    // ! HardCode: Stories
    return Container(
      // padding: EdgeInsets.all(8),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(18 - 3)),
            child: Container(
              height: 60,
              width: 60, // 36 for story
              // ! HardCode: ProfilePicture
              child: Image.asset('assets/highlights/highlight-$index.png'),
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
      padding: EdgeInsets.only(top: 12, bottom: 12, right: 8, left: 16),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: MyColors.grey1, width: 2),
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
            'Add',
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

class TabBarViewDelegate extends SliverPersistentHeaderDelegate {
  TabBarViewDelegate(this._tabBar);
  final TabBar _tabBar;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 48,
      color: MyColors.white,
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
