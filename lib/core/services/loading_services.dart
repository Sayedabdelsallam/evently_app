import 'package:evently_app/core/utils/colors.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void configLoading () {
  EasyLoading.instance
    ..displayDuration = const Duration(seconds: 3)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = MyColors.black
    ..backgroundColor = MyColors.primary
    ..indicatorColor = MyColors.white
    ..textColor = MyColors.white
    ..maskColor = MyColors.black
    ..userInteractions = false
    ..dismissOnTap = false
    ..maskType = EasyLoadingMaskType.black
    ..animationStyle = EasyLoadingAnimationStyle.scale
    ..dismissOnTap = false;
}