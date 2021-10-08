import 'package:flutter/material.dart';
import 'package:sprints_naid_flutter/projects/youtube_api/screens/test_video.dart';
import 'package:sprints_naid_flutter/projects/youtube_api/screens/youtube_api.dart';


class Grade_Selection extends StatefulWidget {
  @override
  _Grade_SelectionState createState() => _Grade_SelectionState();
}

class _Grade_SelectionState extends State<Grade_Selection> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YouTube Channel'),
      ),
      body:

      SingleChildScrollView(
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
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Choose Your Topic",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    // the login button

                    MaterialButton(
                      minWidth: double.infinity,
                      height: 40,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  Youtube_API(Channel_ID: 'UCfPyVJEBD7Di1YYjTdS2v8g', Playlist_ID:'PLNmq_T1B9ljIrk-tCcIEa_stv21EjG9AA')));
                      },
                      color: const Color(0xff0095FF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: const Text(
                        "Animals",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 25),
                      ),
                    ),
                    const SizedBox(height: 10),
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 40,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Youtube_API(Channel_ID: 'UCfPyVJEBD7Di1YYjTdS2v8g', Playlist_ID:'PLNmq_T1B9ljIWyhaewUc8-3oivWLwSTcL')));
                      },
                      color: const Color(0xff0095FF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: const Text(
                        "Science",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 25),
                      ),
                    ),
                    const SizedBox(height: 10),
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 40,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Youtube_API(Channel_ID: 'UCdp4_l1vPmpN-gDbUwhaRUQ', Playlist_ID:'PL6rx9p3tbsMuk0jnC-dBdwb32Z1g7mD0j')));
                      },
                      color: const Color(0xff0095FF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: const Text(
                        "How SSD Works",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 25),
                      ),
                    ),
                    const SizedBox(height: 10),
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 40,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Youtube_API(Channel_ID: 'UCRaC_9WVNkT7D4XJrK713Mw', Playlist_ID:'PLii5rkhsE0LdtTknIAU8v6L1AO5A2l8pE')));
                      },
                      color: const Color(0xff0095FF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: const Text(
                        "KID VOCABULARY",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 25),
                      ),
                    ),
                    const SizedBox(height: 10),
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 40,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Test_Video(Channel_ID: 'UCRaC_9WVNkT7D4XJrK713Mw', Playlist_ID:'PLii5rkhsE0LdtTknIAU8v6L1AO5A2l8pE')));
                      },
                      color: const Color(0xff0095FF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: const Text(
                        "Test Video",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 25),
                      ),
                    ),



                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



// PL6rx9p3tbsMuk0jnC-dBdwb32Z1g7mD0j