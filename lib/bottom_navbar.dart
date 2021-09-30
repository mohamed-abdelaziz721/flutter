import 'package:flutter/material.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:sprints_naid_flutter/home_page.dart';
import 'package:sprints_naid_flutter/projects/http_api/screens/user_details.dart';
import 'package:sprints_naid_flutter/projects/page_navigation/screens/profile_page.dart';
import 'package:sprints_naid_flutter/projects/page_navigation/widgets/appbar_widget.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  List<Widget> pages = [
    HomePage(),
    ProfilePage(),
    UserDetails(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) => Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: _onItemTapped,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_pin),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.people_alt),
                  label: 'Users',
                ),
              ],
            ),
            body: pages[currentIndex]),
      ),
    );
  }
}
