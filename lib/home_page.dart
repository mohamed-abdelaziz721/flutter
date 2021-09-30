import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sprints_naid_flutter/bottom_navbar.dart';
import 'package:sprints_naid_flutter/projects/http_api/screens/user_details.dart';
import 'package:sprints_naid_flutter/projects/http_api/screens/user_screen.dart';
import 'package:sprints_naid_flutter/projects/layout_exercise/screens/cardview1.dart';
import 'package:sprints_naid_flutter/projects/page_navigation/screens/profile_page.dart';
import 'package:sprints_naid_flutter/projects/page_navigation/utils/user_preferences.dart';
import 'package:sprints_naid_flutter/projects/page_navigation/widgets/appbar_widget.dart';
import 'package:sprints_naid_flutter/projects/sign_in_form/screens/sign_in.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:sprints_naid_flutter/projects/page_navigation/model/user.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) => Scaffold(
          appBar: buildAppBar(context),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Container(
                // we will give media query height
                // double.infinity make it big as my parent allows
                // while MediaQuery make it big as per the screen

                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                child: Column(
                  // even space distribution
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        const Text(
                          "Welcome",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Flutter Projects managed by NAID  & Sprints ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Image.asset(
                          'assets/sprints.png',
                          scale: 0.2,
                        )),
                        Expanded(
                            child: Image.asset(
                          'assets/naid.png',
                          scale: 0.2,
                        )),
                        const SizedBox(height: 5)
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        // the login button
                        MaterialButton(
                          minWidth: double.infinity,
                          height: 30,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                          },
                          color: const Color(0xff0095FF),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: const Text(
                            "1. Login Page",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                        ),
                        // creating the signup button
                        // const SizedBox(height: 5),
                        MaterialButton(
                          minWidth: double.infinity,
                          height: 30,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CardView()));
                          },
                          color: const Color(0xff0095FF),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: const Text(
                            "2. Layout Exercise",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                        ),
                        // const SizedBox(height: 5),
                        MaterialButton(
                          minWidth: double.infinity,
                          height: 30,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ProfilePage()));
                          },
                          color: const Color(0xff0095FF),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: const Text(
                            "3. Page Navigation",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                        ),
                        // const SizedBox(height: 5),
                        MaterialButton(
                          minWidth: double.infinity,
                          height: 30,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserDetails()));
                          },
                          color: const Color(0xff0095FF),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: const Text(
                            "4. HTTP Request from an API",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                        ),
                        MaterialButton(
                          minWidth: double.infinity,
                          height: 30,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BottomNavBar()));
                          },
                          color: const Color(0xff0095FF),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: const Text(
                            "5. Bottom Navigation Bar",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                        ),

                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
