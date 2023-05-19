import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import '../screens/activity.dart';
import '../screens/add.dart';
import '../screens/home.dart';
import '../screens/profile.dart';
import '../screens/search.dart';
import '../utils/style.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // ignore: non_constant_identifier_names
  int _SelectedBottomNavigationBarItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: MyColors.grey4,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          currentIndex: _SelectedBottomNavigationBarItem,
          onTap: (int index) {
            setState(() {
              _SelectedBottomNavigationBarItem = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/home-r.svg', height: 26),
              activeIcon:
                  SvgPicture.asset('assets/icons/home-b.svg', height: 26),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/search-r.svg', height: 26),
              activeIcon:
                  SvgPicture.asset('assets/icons/search-b.svg', height: 26),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/add-r.svg', height: 26),
              activeIcon:
                  SvgPicture.asset('assets/icons/add-b.svg', height: 26),
              label: 'Add Post',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/like-r.svg', height: 26),
              activeIcon:
                  SvgPicture.asset('assets/icons/like-b.svg', height: 26),
              label: 'Activity',
            ),
            BottomNavigationBarItem(
              icon: Stack(
                children: [
                  ClipRRect(
                    child: Image.asset('assets/avatars/user-1.jpg', height: 27),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  SvgPicture.asset('assets/icons/pframe-r.svg', height: 27),
                ],
              ),
              activeIcon: Stack(
                children: [
                  ClipRRect(
                    child: Image.asset('assets/avatars/user-1.jpg', height: 27),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  SvgPicture.asset('assets/icons/pframe-b.svg', height: 27),
                ],
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _SelectedBottomNavigationBarItem,
        children: [
          HomeScreen(),
          SearchScreen(),
          AddPost(),
          ActivityScreen(),
          UserProfile(),
        ],
      ),
    );
  }
}
