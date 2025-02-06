import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:evently_app/core/utils/colors.dart';
import 'package:evently_app/res/font_res.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = 'home';

  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _bottomNavIndex = 0; // Track selected index
  final List<IconData> _iconList = [
    Icons.home,
    Icons.search,
    Icons.notifications,
    Icons.person,
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back ✨',
              style: TextStyle(
                color: MyColors.white,
                fontSize: size.height * 0.02,
                fontWeight: FontWeight.w400,
                fontFamily: FontRes.INTER_18PT_REGULAR,
              ),
            ),
            Text(
              'Sayed Abd Elsllam',
              style: TextStyle(
                color: MyColors.white,
                fontSize: size.height * 0.03,
                fontWeight: FontWeight.w700,
                fontFamily: FontRes.INTER_18PT_BOLD,
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: MyColors.primary,
            height: 1.0,
          ),
        ),
      ),
      body: Column(
        children: [

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        elevation: 0.0,
        backgroundColor: MyColors.primary,
        child: const Icon(
          Icons.add,
          color: MyColors.white,
          size: 33.0,
        ),
        shape: const StadiumBorder(
          side: BorderSide(
            color: Color(0xFFffffff),
            width: 5.0,
          ),
      ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: _iconList,
        activeIndex: _bottomNavIndex,
        height: size.height * 0.07,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        //other params
      ),
    );
  }
}
