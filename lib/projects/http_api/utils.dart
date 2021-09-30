import 'package:url_launcher/url_launcher.dart';

void launchURL(String url) async {
  // if (await canLaunch(url)) {
  //   await launch(url);
  // } else {
  //   throw 'Could not Launch $url';
  // }
  
  try{
    await launch(url);
  } catch (e) {
    print(e);
  }

}