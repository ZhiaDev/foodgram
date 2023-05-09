import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodgram/utils/style.dart';
import 'package:google_fonts/google_fonts.dart';

class AddPost extends StatefulWidget {
  AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  String selectedImage = 'assets/posts/post-1.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        centerTitle: false,
        elevation: 0,
        title: Row(
          children: [
            Text(
              'Gallery',
              style: GoogleFonts.outfit(
                textStyle: TextStyle(
                  color: MyColors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(width: 6),
            SvgPicture.asset(
              'assets/icons/arrowdown.svg',
              colorFilter: ColorFilter.mode(MyColors.black, BlendMode.srcIn),
              height: 24,
            ),
          ],
        ),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                _getSelectedImage(context),
                _galleryIamges(),
              ],
            ),
            _getChoosePannel(context),
          ],
        ),
      ),
    );
  }

  Widget _getChoosePannel(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.grey4,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
      ),
      height: 84,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 12, 16, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: Text(
                'Cancel',
                style: GoogleFonts.outfit(
                  textStyle: TextStyle(
                    color: MyColors.red2,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              onTap: () => Navigator.pop(context),
            ),
            Text(
              'choose',
              style: GoogleFonts.outfit(
                textStyle: TextStyle(
                  color: MyColors.grey1,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              'Next',
              style: GoogleFonts.outfit(
                textStyle: TextStyle(
                  color: MyColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getSelectedImage(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverToBoxAdapter(
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(selectedImage),
                fit: BoxFit.cover,
              ),
            ),
            height: MediaQuery.of(context).size.width / 1.081,
            width: MediaQuery.of(context).size.width / 1.081,
          ),
        ),
      ),
    );
  }

  Widget _galleryIamges() {
    return SliverPadding(
      padding: EdgeInsets.fromLTRB(16, 6, 16, 96),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/posts/post-${index + 1}.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  selectedImage = 'assets/posts/post-${index + 1}.png';
                });
              },
            );
          },
          childCount: 21,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 6,
          crossAxisSpacing: 6,
        ),
      ),
    );
  }
}
