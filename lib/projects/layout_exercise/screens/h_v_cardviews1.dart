import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HVCardView extends StatelessWidget {
  const HVCardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.grey,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,),


        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color:Colors.grey,
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
    );
  }

}