import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sprints_naid_flutter/projects/page_navigation/model/user.dart';
import 'package:sprints_naid_flutter/projects/page_navigation/utils/user_preferences.dart';
import 'package:sprints_naid_flutter/projects/page_navigation/widgets/appbar_widget.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';


class HVCardView extends StatefulWidget {
  const HVCardView({Key? key}) : super(key: key);
  @override
  _HVCardView createState() => _HVCardView();

}

class _HVCardView extends State<HVCardView> {
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
        body: Container(
          height: MediaQuery.of(context).size.height,
          color:Colors.white,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: const <Widget>[
                      Text("Card Views",
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Card(
                        color: Colors.black12,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const <Widget>[
                            Icon(Icons.access_time_sharp),
                            ListTile(
                              title: Text('The Enchanted Nightingale',textAlign: TextAlign.center,),
                              subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.',textAlign: TextAlign.center,),
                            ),

                          ],
                        ),
                      ),
                      Card(
                        color: Colors.black12,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const <Widget>[
                            Icon(Icons.light),
                            ListTile(
                              title: Text('The Enchanted Nightingale', textAlign: TextAlign.center,),
                              subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.',textAlign: TextAlign.center,),
                            ),

                          ],
                        ),
                      )

                    ],
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child:
                      Card(
                        color: Colors.black12,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const <Widget>[
                            Icon(Icons.access_time_sharp),
                            ListTile(
                              title: Text('The Enchanted Nightingale', textAlign: TextAlign.center,),
                              subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.', textAlign: TextAlign.center,),
                            ),

                          ],
                        ),
                      ),

                      ),
                      const VerticalDivider(width: 1.0),
                      Expanded(child:
                      Card(
                        color: Colors.black12,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const <Widget>[
                            Icon(Icons.light),
                            ListTile(
                              title: Text('The Enchanted Nightingale', textAlign: TextAlign.center,),
                              subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.', textAlign: TextAlign.center,),
                            ),

                          ],
                        ),
                      )
                      ),
                    ],
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
