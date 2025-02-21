import 'package:evently_app/core/routs/app_routs.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:evently_app/core/services/loading_services.dart';
import 'package:evently_app/layout/settings_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme_manger.dart';
import 'firebase_options.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => SettingsProvider(),
      child: MyApp(),
    ),
  );

  configLoading();
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final SettingsProvider provider = SettingsProvider();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.currentLanguage),
      theme: AppThemeManager.lightTheme,
      darkTheme: AppThemeManager.darkTheme,
      themeMode: provider.currentTheme,
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      onGenerateRoute: AppRoutes.onGeneratedRoute,
      builder: EasyLoading.init(
        builder: BotToastInit(),
      ),
    );
  }
}
