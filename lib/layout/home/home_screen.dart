import 'package:evently_app/core/extensions/dimensions.dart';
import 'package:evently_app/core/utils/colors.dart';
import 'package:evently_app/core/widgets/custom_button.dart';
import 'package:evently_app/layout/home/widgets/categoryCard.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import 'widgets/custom_tap_bar_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 6,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: MyColors.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            width: double.infinity,
            height: size.height * 0.27,
            padding: EdgeInsets.all(16.0),
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome back',
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
                      SvgPicture.asset('assets/icons/themeMode.svg',
                        height: size.height * 0.035,
                      ),
                      15.spaceHorizontal,
                      CustomButton(
                          title: 'EN',
                        onTab: (){},
                        bgColor: MyColors.white,
                        titleColor: MyColors.primary,
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
                    child: TabBar(
                      onTap: (index){},
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      indicatorColor: Colors.transparent,
                      dividerColor: Colors.transparent,
                      tabs: [
                        CustomTapBarItem(
                          isSelected: false,
                          size: size,
                          title: 'All',
                          icon: Icons.directions_outlined,
                        ),
                        CustomTapBarItem(
                          isSelected: true,
                          size: size,
                          title: 'All',
                          icon: Icons.directions_outlined,
                        ),
                        CustomTapBarItem(
                          isSelected: false,
                          size: size,
                          title: 'All',
                          icon: Icons.directions_outlined,
                        ),
                        CustomTapBarItem(
                          isSelected: false,
                          size: size,
                          title: 'All',
                          icon: Icons.directions_outlined,
                        ),
                        CustomTapBarItem(
                          isSelected: false,
                          size: size,
                          title: 'All',
                          icon: Icons.directions_outlined,
                        ),
                        CustomTapBarItem(
                          isSelected: false,
                          size: size,
                          title: 'All',
                          icon: Icons.directions_outlined,
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          16.spaceVertical,
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) => CategoryCard(),
                separatorBuilder: (context, index) => 16.spaceVertical,
                itemCount: 5 ,
            ),
          ),
        ],
      ),
    );
  }
}


