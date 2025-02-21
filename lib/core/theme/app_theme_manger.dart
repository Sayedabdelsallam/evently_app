import 'package:evently_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

abstract class AppThemeManager {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.white,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: MyColors.primary,
      landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
      selectedItemColor: MyColors.white,
      unselectedItemColor: MyColors.white,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xFF101127),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Color(0xFF101127),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor:Color(0xFF101127),
      landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
      selectedItemColor: MyColors.white,
      unselectedItemColor: MyColors.white,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
  );
}