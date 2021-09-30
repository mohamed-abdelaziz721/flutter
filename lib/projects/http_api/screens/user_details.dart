import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sprints_naid_flutter/projects/http_api/screens/user_screen.dart';
import 'package:sprints_naid_flutter/projects/http_api/utils.dart';
import 'package:sprints_naid_flutter/projects/page_navigation/widgets/appbar_widget.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:sprints_naid_flutter/projects/page_navigation/widgets/button_widget.dart';

class UserDetails extends StatefulWidget {
   const UserDetails({Key? key}) : super(key: key);

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  Map data = {};

  @override
  Widget build(BuildContext context) {


    String name = data.isEmpty? "Username" : data['Name'] ;
    String email = data.isEmpty? "email.placeholder@gmail.com" : data['Email'] ;
    String city = data.isEmpty? "City" : data['City'];
    String company = data.isEmpty? "Company" :  data['Company'] ;
    String phone = data.isEmpty? "+20 15 525 16 133" :  data['Phone'] ;
    String website = data.isEmpty? "www.placeholder.com" :  data['Website'] ;



    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) => Scaffold(
          appBar: buildAppBar(context),
          body: ListView(
            children: [
              const Text("User Data Placeholder Page For HTTP Request", textAlign: TextAlign.center,),
              const SizedBox(height: 24),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.white70,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:  <Widget>[
                        const SizedBox(height: 5,),
                        const Icon(Icons.account_circle_outlined),
                        ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.person, size: 15,),
                              Text(name,),
                            ],
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.email, size: 15,),
                              InkWell(
                                onTap: (){
                                  launchURL("mailto:${email}?subject=NAID-Sprints&body=Flutter Launch_URL Trial");
                                } ,
                                  child: Text(email,)
                              ),
                            ],
                          ),
                        ),
                        ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.apartment, size: 15,),
                              Text(company,),
                            ],
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.location_on_sharp, size: 15,),
                              Text(city,),
                            ],
                          ),
                        ),
                        ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.phone_android, size: 15,),
                              InkWell(
                                  onTap: (){
                                    launchURL("tel:${phone}");
                                  },
                                  child: Text(phone,)),
                            ],
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.web, size: 15,),
                              InkWell(
                                onTap: (){
                                  launchURL("http://${website}");
                                },
                                  child: Text(website,)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Center(child: buildButton()),
              const SizedBox(height: 24),
              const Text("Press the button to see the whole users list -> Choose a user to get his/her details   ", textAlign: TextAlign.center,),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton() => ButtonWidget(
        /* This button will ensure that when choosing a user his/her data
           will be saved and displayed on the placeholder page as the data
           is popped with the tap action.
        */
        text: 'Show Users List',
        onClicked: () async {
          dynamic result = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const UserScreen()));
                  setState(() {
                    data = {
                      'Name': result['Name'],
                      'Email': result['Email'],
                      'City': result['City'],
                      'Company': result['Company'],
                      'Phone': result['Phone'],
                      'Website': result['Website'],
                    };
                  });


        },
      );
}
