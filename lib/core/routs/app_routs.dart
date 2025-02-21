import 'package:evently_app/core/routs/pages_route_name.dart';
import 'package:evently_app/layout/home/edit_event.dart';
import 'package:evently_app/layout/home_layout.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/modules/create_event/create_event_screen.dart';
import 'package:evently_app/modules/evnent_map/event_map.dart';
import 'package:evently_app/modules/forget_screen/forget_pass_screen.dart';
import 'package:evently_app/modules/login_screen/login_screen.dart';
import 'package:evently_app/modules/on_boarding_screen/on_boarding_screen.dart';
import 'package:evently_app/modules/register_screen/register_screen.dart';
import 'package:evently_app/modules/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import '../../layout/home/event_details.dart';

abstract class AppRoutes {
  static Route onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRouteName.initial:
        {
          return MaterialPageRoute(
            builder: (context) => const SplashScreen(),
            settings: settings,
          );
        }

      case PagesRouteName.onBoarding:
        {
          return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen(),
            settings: settings,
          );
        }

      case PagesRouteName.signIn:
        {
          return MaterialPageRoute(
            builder: (context) => const LoginScreen(),
            settings: settings,
          );
        }

      case PagesRouteName.signUp:
        {
          return MaterialPageRoute(
            builder: (context) => const RegisterScreen(),
            settings: settings,
          );
        }

      case PagesRouteName.forgetPassword:
        {
          return MaterialPageRoute(
            builder: (context) => const ForgetPassScreen(),
            settings: settings,
          );
        }

      case PagesRouteName.layout:
        {
          return MaterialPageRoute(
            builder: (context) => const HomeLayout(),
            settings: settings,
          );
        }
      case PagesRouteName.createNewEvent:
        {
          return MaterialPageRoute(
            builder: (context) => const CreateEventScreen(),
            settings: settings,
          );
        }
      case PagesRouteName.eventMap:
        {
          return MaterialPageRoute(
            builder: (context) => const EventMap(),
            settings: settings,
          );
        }
      case PagesRouteName.eventDetails:
        {
          return MaterialPageRoute(
            builder: (context) =>  EventDetails(eventDataModel: settings.arguments as EventDataModel,),
            settings: settings,
          );
        }
      case PagesRouteName.eventEdit:
        {
          return MaterialPageRoute(
            builder: (context) =>  EditEvent(),
            settings: settings,
          );
        }
      default:
        {
          return MaterialPageRoute(
            builder: (context) => const SplashScreen(),
            settings: settings,
          );
        }
    }
  }
}