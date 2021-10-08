import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sprints_naid_flutter/projects/page_navigation/utils/user_preferences.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:sprints_naid_flutter/projects/youtube_api/screens/speech_to_text.dart';
import '../../../themes.dart';

AppBar buildAppBar(BuildContext context) {
  final user = UserPreferences.getUser();
  final isDarkMode = user.isDarkMode;
  // final icon = isDarkMode ? CupertinoIcons.sun_max : CupertinoIcons.moon_stars;
  final icon = Icons.volume_up;

  return AppBar(
    leading: const BackButton(),
    foregroundColor: Colors.blueAccent,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30),
      ),
    ),
    elevation: 0,
    actions: [
      ThemeSwitcher(
        builder: (context) => IconButton(
          icon: Icon(icon),
          onPressed: () {

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AudioScreen()));

          },
        ),
      ),
    ],
  );
}