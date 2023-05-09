import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/activity_enum.dart';
import '../utils/style.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 48,
              color: Colors.transparent,
              child: TabBar(
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
                controller: _tabController,
                tabs: const [
                  Tab(
                    text: 'Following',
                  ),
                  Tab(
                    text: 'You',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _getSampleList(),
                  _getSampleList(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  CustomScrollView _getSampleList() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 18,
              bottom: 18,
              top: 30,
            ),
            child: Text(
              'New',
              style: GoogleFonts.outfit(
                textStyle: const TextStyle(
                  fontSize: 20,
                  color: MyColors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (
              context,
              index,
            ) {
              return _getActivitylist(index, ActivityActionStatus.message);
            },
            childCount: 1,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (
              context,
              index,
            ) {
              return _getActivitylist(
                  index + 1, ActivityActionStatus.likedPost);
            },
            childCount: 1,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 18,
              bottom: 18,
              top: 14,
            ),
            child: Text(
              'Today',
              style: GoogleFonts.outfit(
                textStyle: const TextStyle(
                  fontSize: 20,
                  color: MyColors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (
              context,
              index,
            ) {
              return _getActivitylist(
                  index + 2, ActivityActionStatus.followBack);
            },
            childCount: 1,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (
              context,
              index,
            ) {
              return _getActivitylist(
                  index + 3, ActivityActionStatus.likedPost);
            },
            childCount: 1,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (
              context,
              index,
            ) {
              return _getActivitylist(
                  index + 4, ActivityActionStatus.followBack);
            },
            childCount: 1,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 18,
              bottom: 18,
              top: 14,
            ),
            child: Text(
              'This week',
              style: GoogleFonts.outfit(
                textStyle: const TextStyle(
                  fontSize: 20,
                  color: MyColors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (
              context,
              index,
            ) {
              return _getActivitylist(
                  index + 5, ActivityActionStatus.likedPost);
            },
            childCount: 1,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (
              context,
              index,
            ) {
              return _getActivitylist(index + 6, ActivityActionStatus.message);
            },
            childCount: 1,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (
              context,
              index,
            ) {
              return _getActivitylist(
                  index + 7, ActivityActionStatus.followBack);
            },
            childCount: 1,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (
              context,
              index,
            ) {
              return _getActivitylist(
                  index + 8, ActivityActionStatus.likedPost);
            },
            childCount: 4,
          ),
        ),
      ],
    );
  }

  Widget _getActivitylist(index, status) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 16, right: 6),
            height: 6,
            width: 6,
            decoration: BoxDecoration(
              color: MyColors.red3,
              shape: BoxShape.circle,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
              height: 44,
              width: 44,
              child: Image.asset('assets/avatars/user-$index.jpg'),
            ),
          ),
          SizedBox(width: 8),
          Container(
            width: MediaQuery.of(context).size.width / 1.86,
            child: RichText(
              text: TextSpan(
                style: GoogleFonts.outfit(),
                children: const <TextSpan>[
                  TextSpan(
                    text: 'Parsa Sharifi',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: MyColors.black,
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text: '  Started following you  ',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: MyColors.grey1,
                      fontSize: 12,
                    ),
                  ),
                  TextSpan(
                    text: '3min',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: MyColors.grey1,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          _getActivityAction(status, index),
          SizedBox(width: 16)
        ],
      ),
    );
  }

  Widget _getActivityAction(ActivityActionStatus status, index) {
    switch (status) {
      case ActivityActionStatus.followBack:
        return TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            'Follow',
            style: GoogleFonts.outfit(
              textStyle: TextStyle(
                color: MyColors.white,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
        );

      case ActivityActionStatus.likedPost:
        return ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Container(
            height: 44,
            width: 44,
            child: Image.asset('assets/posts/post-$index.png'),
          ),
        );
      case ActivityActionStatus.message:
        return TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            side: BorderSide(
              color: MyColors.grey1,
              width: 1,
            ),
            backgroundColor: Colors.transparent,
          ),
          child: Text(
            'Message',
            style: GoogleFonts.outfit(
              textStyle: TextStyle(
                color: MyColors.grey1,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
        );
    }
  }
}
