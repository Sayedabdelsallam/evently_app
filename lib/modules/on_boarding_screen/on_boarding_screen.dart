import 'package:evently_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../layout/home_layout.dart';
import '../login_screen/login_screen.dart';
import 'widgets/on_boarding_item.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  static const String routeName = 'onBoarding';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController controller = PageController();
  // void initState() {
  //   SharedPref.setBool(SharedPrefKeys.isFirstTimeRun, false);
  //   super.initState();
  // }

  final List<Widget> items = [
    // OnBoardingItem(
    //   title: 'Personalize Your Experience',
    //   image: 'assets/images/onBoarding1.png',
    //   description: 'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.',
    // ),
    OnBoardingItem(
      title: 'Find Events That Inspire You',
      image: 'assets/images/onBoarding2.png',
      description: 'Dive into a world of events crafted to fit your unique interests. Whether you\'re into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.',
    ),
    OnBoardingItem(
      title: 'Effortless Event Planning',
      image: 'assets/images/onBoarding3.png',
      description: 'Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.',
    ),
    OnBoardingItem(
      title: 'Connect with Friends & Share Moments',
      image: 'assets/images/onBoardng4.png',
      description: 'Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.',
    ),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: MyColors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top background image
            Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/images/eventlyLogo.png',
                    height: size.height * 0.07,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            // PageView
            Expanded(
              child: PageView.builder(
                controller: controller,
                physics: const BouncingScrollPhysics(),
                itemCount: items.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return items[index];
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Row(
                children: [
                  if (currentIndex > 0)
                    IconButton(
                      onPressed: () {
                        controller.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      icon:  Icon(
                        Icons.arrow_circle_left_outlined,
                        color: MyColors.primary,
                        size: 40.0,
                      ),
                    ),
                  const Spacer(),
                  SmoothPageIndicator(
                    controller: controller,
                    count: items.length,
                    effect: const WormEffect(
                      dotColor: MyColors.black,
                      activeDotColor: MyColors.primary,
                      dotHeight: 8.0,
                      dotWidth: 8.0,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      if (currentIndex < items.length - 1) {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                      }
                    },
                    icon:  Icon(
                      Icons.arrow_circle_right_outlined,
                      color: MyColors.primary,
                      size: 40.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}