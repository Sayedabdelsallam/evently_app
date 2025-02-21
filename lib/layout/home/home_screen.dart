import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/core/extensions/dimensions.dart';
import 'package:evently_app/core/services/firebase_firestore_services.dart';
import 'package:evently_app/core/theme/colors.dart';
import 'package:evently_app/core/widgets/custom_button.dart';
import 'package:evently_app/layout/home/widgets/categoryCard.dart';
import 'package:evently_app/layout/home/widgets/home_tab_widget.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:svg_flutter/svg.dart';
import '../../models/event_category.dart';
import '../settings_provider.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key, });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTab = 0;
  List<EventCategory> eventCategories = [
    EventCategory(
      eventCategoryName: "Book Club",
      eventCategoryIcon: Icons.menu_book_outlined,
      eventCategoryImg: "assets/images/bookClubCard.png",
    ),
    EventCategory(
        eventCategoryName: "Sport",
        eventCategoryIcon: Icons.directions_bike,
        eventCategoryImg: "assets/images/sportsCard.png"),
    EventCategory(
        eventCategoryName: "BirthDay",
        eventCategoryIcon: Icons.cake_outlined,
        eventCategoryImg: "assets/images/birthDayCard.png"),
    EventCategory(
        eventCategoryName: "Meeting",
        eventCategoryIcon: Icons.meeting_room_outlined,
        eventCategoryImg: "assets/images/meetingCard.png"),
    EventCategory(
        eventCategoryName: "Holiday",
        eventCategoryIcon: Icons.holiday_village_outlined,
        eventCategoryImg: "assets/images/holidayCard.png"),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var provider = Provider.of<SettingsProvider>(context);
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: provider.isDark() ? Color(0xFF101127) : MyColors.primary,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
          width: double.infinity,
          height: size.height * 0.28,
          padding: EdgeInsets.symmetric(horizontal: 16.0 , vertical: 14.0),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome back..',
                          style: TextStyle(
                            color: MyColors.white,
                            fontSize: size.height * 0.027,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'Sayed',
                          style: TextStyle(
                            color: MyColors.white,
                            fontSize: size.height * 0.029,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: ()
                      {
                        provider.isDark() ? provider.setCurrentTheme(ThemeMode.light) : provider.setCurrentTheme(ThemeMode.dark);
                      },
                      child: SvgPicture.asset('assets/icons/themeMode.svg',
                        height: size.height * 0.035,
                      ),
                    ),
                    15.spaceHorizontal,
                    CustomButton(
                      title: provider.currentLanguage == 'en' ? 'EN' : 'AR',
                      onTab: ()
                      {
                        provider.currentLanguage == 'en' ? provider.setCurrentLanguage('ar') : provider.setCurrentLanguage('en');
                      },
                      bgColor: MyColors.white,
                      titleColor: provider.isDark() ? MyColors.black : MyColors.primary,
                      borderRadius: 8,
                    ),
                  ],
                ),
                16.spaceVertical,
                Row(
                  children: [
                    Icon(Icons.location_on_outlined, color: MyColors.white,),
                    5.spaceHorizontal,
                    Text(
                      'Ismailia, Egypt',
                      style: TextStyle(
                        color: MyColors.white,
                        fontSize: size.height * 0.019,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                8.spaceVertical,
                Expanded(
                  child: DefaultTabController(
                    length: 5,
                    child: TabBar(
                        dividerHeight: 0,
                        isScrollable: true,
                        tabAlignment: TabAlignment.start,
                        indicatorPadding: EdgeInsets.zero,
                        labelPadding: const EdgeInsets.symmetric(horizontal: 6.0),
                        padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                        indicator: const BoxDecoration(),
                        onTap: (value) {
                          setState(() {
                            selectedTab = value;
                          });
                        },
                        tabs: eventCategories.map(
                              (element) {
                            return HomeTabWidget(
                              eventCategory: element,
                              isSelected:
                              selectedTab == eventCategories.indexOf(element),
                            );
                          },
                        ).toList()),
                  ),
                ),
              ],
            ),
          ),
        ),
        8.spaceVertical,
        StreamBuilder<QuerySnapshot<EventDataModel>>(
            stream: FirebaseFirestoreService.getStreamDataFromFirestore(eventCategories[selectedTab].eventCategoryName),
            builder: (builder, snapshot) {
              if(snapshot.hasError)
              {
                return Column(
                  children: [
                    Text('Something went wrong'),
                    20.spaceVertical,
                    IconButton(
                      onPressed: (){},
                      icon: Icon(
                        Icons.refresh,
                        color: MyColors.primary,
                      ),
                    ),
                  ],
                );
              }

              if(snapshot.connectionState == ConnectionState.waiting)
              {
                return Center(child: CircularProgressIndicator(color: MyColors.primary,));
              }

              List<EventDataModel> eventDataList = snapshot.data!.docs.map(
                      (element)
                  {
                    return element.data();
                  }).toList();

              return eventDataList.isNotEmpty ? Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) => CategoryCard(eventDataModel: eventDataList[index],),
                  separatorBuilder: (context, index) => 16.spaceVertical,
                  itemCount: eventDataList.length ,
                ),
              ) : Center(child: Text(
                  'No Events',
                style: theme.textTheme.titleLarge,
              ),);
            },
        ),
      ],
    );
  }
}


