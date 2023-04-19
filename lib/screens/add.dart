import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      backgroundColor: Color(0xFF14151C),
      appBar: AppBar(
        backgroundColor: Color(0xFF14151C),
        centerTitle: false,
        elevation: 0,
        title: Row(
          children: [
            Text(
              'Gallery',
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
        color: Color(0xFF202232),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
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
                    color: Color(0xFFFD3F3F),
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
                  color: Color(0xFF7A7A7D),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              'Next',
              style: GoogleFonts.outfit(
                textStyle: TextStyle(
                  color: Colors.white,
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
