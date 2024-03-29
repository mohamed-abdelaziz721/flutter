import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sprints_naid_flutter/projects/layout_exercise/screens/h_v_cardviews1.dart';
import 'package:sprints_naid_flutter/projects/page_navigation/model/user.dart';
import 'package:sprints_naid_flutter/projects/page_navigation/utils/user_preferences.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:sprints_naid_flutter/projects/page_navigation/widgets/appbar_widget.dart';

class CardView extends StatefulWidget {
  const CardView({Key? key}) : super(key: key);

  @override
  _CardView createState() => _CardView();
}


class _CardView extends State<CardView> {
  late User user;

  @override
  void initState() {
    super.initState();

    user = UserPreferences.getUser();
  }

  @override
  Widget build(BuildContext context) => ThemeSwitchingArea(
    child: Builder(
      builder: (context) => Scaffold(
        appBar: buildAppBar(context),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: const <Widget>[
                      Text("Layout Exercise",
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 100),
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/welcome.png"),
                          fit: BoxFit.fitHeight
                      ),
                    ),
                  ),
                  const Text("Horizontal & Vertical CardViews ",
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  const Text("Next page will show CardViews in different layouts \n Horizontal CardViews \n Vertical CardViews",
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
                  Padding(padding:
                  const EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      padding: const EdgeInsets.only(top: 3, left: 3),
                      decoration:
                      BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: const Border(
                            bottom: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                          )
                      ),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const HVCardView()));
                        },
                        color: const Color(0xff0095FF),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Text(
                          "Card Views", style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,

                        ),
                        ),
                      ),
                    ),
                  ),


                ],
              ))
            ],
          ),
        ),
      ),
    ),
  );
}



