import 'package:evently_app/core/extensions/context_extensions.dart';
import 'package:evently_app/core/routs/pages_route_name.dart';
import 'package:evently_app/core/theme/colors.dart';
import 'package:evently_app/layout/fav/favourites_screen.dart';
import 'package:evently_app/layout/home/home_screen.dart';
import 'package:evently_app/layout/map/map_screen.dart';
import 'package:evently_app/layout/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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
    SizedBox(), // Empty screen for the middle icon in BottomNavigationBar
    FavouritesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    var theme = Theme.of(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(// Removed the redundant backgroundColor
        body: screens[bottomNavIndex],
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.goToNamed(PagesRouteName.createNewEvent),
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
        items:  [
        BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined,size: 30.0,),
    activeIcon: Icon(Icons.home,
    size: 30.0,
    ),
    label: locale?.home,
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.location_on_outlined,size: 30.0,),
    activeIcon: Icon(Icons.location_on,size: 30.0,),
    label: locale?.map,
    ),
    BottomNavigationBarItem(
    icon: SizedBox.shrink(),
    label: '',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.favorite_outline,size: 30.0,),
    activeIcon: Icon(Icons.favorite,size: 30.0,),
    label: locale?.favourites,
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.person_outlined,size: 30.0,),
    activeIcon: Icon(Icons.person,size: 30.0,),
    label: locale?.profile,
    ),
    ],
    currentIndex: bottomNavIndex,
    selectedFontSize: size.height * 0.016,

    onTap: (index) {
    if (index == 2) return;
    setState(() => bottomNavIndex = index);
    },),);
  }
}
