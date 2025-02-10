import 'package:evently_app/core/utils/colors.dart';
import 'package:evently_app/layout/fav/favourites_screen.dart';
import 'package:evently_app/layout/home/home_screen.dart';
import 'package:evently_app/layout/map/map_screen.dart';
import 'package:evently_app/layout/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = 'home';

  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int bottomNavIndex = 0;
  final List<Widget> screens = [
    HomeScreen(),
    MapScreen(),
    SizedBox(),
    FavouritesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[bottomNavIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        elevation: 0.0,
        backgroundColor: MyColors.primary,
        shape: const StadiumBorder(
          side: BorderSide(
            color: MyColors.white,
            width: 5.0,
          ),
        ),
        child: const Icon(
          Icons.add,
          color: MyColors.white,
          size: 33.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        items:
        const [BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'Home',
        ) ,
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on_outlined),
          activeIcon: Icon(Icons.location_on),
          label: 'Map',
        ),
          BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            label: '',
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          activeIcon: Icon(Icons.favorite),
          label: 'Favourites',
        ) ,
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outlined),
          activeIcon: Icon(Icons.person),
          label: 'Profile',
        ) ,
        ],
        currentIndex: bottomNavIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: MyColors.primary,
        selectedItemColor: MyColors.white,
        unselectedItemColor: MyColors.white,
        selectedFontSize: size.height * 0.015,
        showSelectedLabels: true,
        onTap: (index) {
          if (index == 2) return;
          setState(() {
            bottomNavIndex = index;
          });
        },
      ),
    );
  }
}
