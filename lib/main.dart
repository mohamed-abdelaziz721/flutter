import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sprints_naid_flutter/projects/layout_exercise/screens/cardview1.dart';
import 'package:sprints_naid_flutter/projects/sign_in_form/screens/sign_in.dart';



void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false,
    home:HomePage(),
  ));
}

class HomePage  extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // we will give media query height
          // double.infinity make it big as my parent allows
          // while MediaQuery make it big as per the screen

          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            // even space distribution
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                  Text("Flutter Projects managed by NAID  & Sprints ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15,
                    ),)
                  ,const SizedBox(
                    height: 20,
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: Image.asset('assets/sprints.png',scale: 0.6,)),
                  Expanded(child: Image.asset('assets/naid.png',scale: 0.6,)),
                  const SizedBox(height: 20)
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                    },
                    color: const Color(0xff0095FF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: const Text(
                      "1. Login Page",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18
                      ),
                    ),
                  ),
                  // creating the signup button
                  const SizedBox(height:10),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 40,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const CardView()));
                    },
                    color: const Color(0xff0095FF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: const Text(
                      "2. Layout Exercise",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18
                      ),
                    ),
                  ),
                  const SizedBox(height:10),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 40,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginPage()));

                    },
                    color: const Color(0xff0095FF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: const Text(
                      "3. Page Navigation",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18
                      ),
                    ),
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}

