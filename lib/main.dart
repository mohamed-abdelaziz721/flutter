import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sprints_naid_flutter/bottom_navbar.dart';
import 'package:sprints_naid_flutter/gp_home.dart';
import 'package:sprints_naid_flutter/home_page.dart';
import 'package:sprints_naid_flutter/projects/page_navigation/utils/user_preferences.dart';
import 'package:sprints_naid_flutter/themes.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await UserPreferences.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Sprints_NAID_Flutter';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();

    return ThemeProvider(
      initTheme: user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
      child: Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeProvider.of(context),
          title: title,
          // home:  GP_Home(),
          home:  GP_Home(),
        ),
      ),
    );
  }
}