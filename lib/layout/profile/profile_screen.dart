import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:evently_app/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/routs/pages_route_name.dart';
import '../../core/services/firebase_auth_services.dart';
import '../../core/theme/colors.dart';
import '../settings_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);
    var provider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: mediaQuery.size.height * 0.25,
            width: double.infinity,
            padding:
            const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
            decoration: const BoxDecoration(
              color: MyColors.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(64.0),
              ),
            ),
            child: Row(
              children: [
                Container(
                  height: 124,
                  width: 124,
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    color: MyColors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(1000),
                      bottomRight: Radius.circular(1000),
                      topRight: Radius.circular(1000),
                      topLeft: Radius.circular(25),
                    ),
                  ),
                  child: Image.asset("assets/images/eventlyLogo.png"),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sayed Abd Elsallam",
                        style: theme.textTheme.headlineSmall?.copyWith(
                            color: MyColors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "sayed.abdelsallam@gmail.com",
                        style: theme.textTheme.titleMedium?.copyWith(
                            color: MyColors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.02,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Language",
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: provider.isDark() ? MyColors.white : MyColors.black
                ),
              ),
              SizedBox(
                height: mediaQuery.size.height * 0.02,
              ),
              CustomDropdown(
                  items: provider.languagesList,
                  hintText: provider.currentLanguage == "en" ? "English" : "عربي",
                  onChanged: (value)
                  {
                    if (value == "English") provider.setCurrentLanguage("en");
                    if (value != "English") provider.setCurrentLanguage("ar");

                  },
                decoration: CustomDropdownDecoration(
                  closedBorder: Border.all(
                    color: MyColors.primary,
                    width: 2.0
                  ),
                    closedBorderRadius: BorderRadius.circular(16.0),
                    listItemStyle: theme.textTheme.titleMedium?.copyWith(
                      color: MyColors.gray,
                      fontWeight: FontWeight.w500,
                    ),
                    headerStyle: theme.textTheme.titleLarge?.copyWith(
                      color: MyColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  closedSuffixIcon: Icon(Icons.arrow_drop_down,
                  color: MyColors.primary,
                    size: 28.0,
                  ),
                ),
              ),
              SizedBox(
                height: mediaQuery.size.height * 0.06,
              ),
              Text(
                "Theme Mode",
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                    color: provider.isDark() ? MyColors.white : MyColors.black

                ),
              ),
              SizedBox(
                height: mediaQuery.size.height * 0.02,
              ),
              CustomDropdown(
                items: provider.themeList,
                hintText: provider.isDark() ? "Dark" : "Light",
                onChanged: (value) {
                  if (value == "Dark") provider.setCurrentTheme(ThemeMode.dark);
                  if (value == "Light")
                    provider.setCurrentTheme(ThemeMode.light);
                },
                decoration: CustomDropdownDecoration(
                  closedBorder: Border.all(
                      color: MyColors.primary,
                      width: 2.0
                  ),
                  closedBorderRadius: BorderRadius.circular(16.0),
                  listItemStyle: theme.textTheme.titleMedium?.copyWith(
                    color: MyColors.gray,
                    fontWeight: FontWeight.w500,
                  ),
                  headerStyle: theme.textTheme.titleLarge?.copyWith(
                    color: MyColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  closedSuffixIcon: Icon(Icons.arrow_drop_down,
                    color: MyColors.primary,
                    size: 28.0,
                  ),
                ),
              ),
              SizedBox(
                height: mediaQuery.size.height * 0.26,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                  backgroundColor: Color(0xFFFF5659),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                onPressed: () async {
                  bool confirmLogout = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Confirm Logout"),
                        content: Text("Are you sure you want to log out?"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: Text("Logout", style: TextStyle(color: Colors.red)),
                          ),
                        ],
                      );
                    },
                  );

                  if (confirmLogout == true) {
                    try {
                      await FirebaseAuthService.logoutUser();
                      Navigator.pushNamedAndRemoveUntil(context, PagesRouteName.signIn, (route) => false);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Failed to log out. Try again!")),
                      );
                    }
                  }
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: MyColors.white,
                      size: 24.0,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Logout",
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: MyColors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mediaQuery.size.height * 0.02,
              ),
            ],
          ).setHorizontalPadding(context, 0.035),
        ],
      ),
    );
  }
}