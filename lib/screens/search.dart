import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodgram/utils/style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: SafeArea(
          child: CustomScrollView(
        slivers: [_getSearchBox(), _getCategories(context), _getExplore()],
      )),
    );
  }

  SliverToBoxAdapter _getSearchBox() {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(right: 16, left: 16, top: 8),
        height: 46,
        decoration: BoxDecoration(
          color: MyColors.grey4,
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
                colorFilter: ColorFilter.mode(MyColors.black, BlendMode.srcIn),
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
              ),
              SizedBox(width: 14),
              SvgPicture.asset(
                'assets/icons/scan.svg',
                colorFilter: ColorFilter.mode(MyColors.black, BlendMode.srcIn),
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _getCategories(context) {
    return SliverToBoxAdapter(
      child: Container(
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
                color: MyColors.grey4,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Text(
                    'category k.$index',
                    style: GoogleFonts.outfit(
                      textStyle: TextStyle(
                        color: MyColors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _getExplore() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16),
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
            QuiltedGridTile(2, 1),
            QuiltedGridTile(2, 2),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(2, 2),
            QuiltedGridTile(2, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
          ],
        ),
      ),
    );
  }
}
