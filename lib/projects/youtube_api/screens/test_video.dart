import 'package:flutter/material.dart';
import 'package:sprints_naid_flutter/projects/youtube_api/models/channel_model.dart';
import 'package:sprints_naid_flutter/projects/youtube_api/models/video_model.dart';
import 'package:sprints_naid_flutter/projects/youtube_api/screens/video_caption_gif.dart';
import 'package:sprints_naid_flutter/projects/youtube_api/screens/video_screen.dart';
import 'package:sprints_naid_flutter/projects/youtube_api/services/api_service.dart';

class Test_Video extends StatefulWidget {
  final String Channel_ID;
  final String Playlist_ID;
  Test_Video({Key? key, required this.Channel_ID, required this.Playlist_ID}) : super(key: key);

  @override
  _Test_VideoState createState() => _Test_VideoState();
}

class _Test_VideoState extends State<Test_Video> {

  late Channel _channel ;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initChannel();
  }

  _initChannel() async {
    _isLoading=  true;
    Channel channel = await APIService.instance
        .fetchChannel(widget.Channel_ID, widget.Playlist_ID);
    setState(() {
      _channel = channel;
    });
    _isLoading = false;
  }



  _buildProfileInfo() {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      height: 100.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 1),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 35.0,
            backgroundImage: NetworkImage(_channel.profilePictureUrl),
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _channel.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${_channel.subscriberCount} subscribers',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildVideo(Video video) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          // builder: (_) => VideoScreen(id: 'FHaObkHEkHQ'),
          builder: (_) => VideoCaptionGIF(id: 'FHaObkHEkHQ'),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        padding: EdgeInsets.all(10.0),
        height: 140.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 1),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Image(
              width: 150.0,
              image: NetworkImage(video.thumbnailUrl),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Text(
                video.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('YouTube Channel'),
      ),
      body: _isLoading == false
          ? NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollDetails) {
          if (!_isLoading &&
              _channel.videos.length != int.parse(_channel.videoCount) &&
              scrollDetails.metrics.pixels ==
                  scrollDetails.metrics.maxScrollExtent) {
          }
          return false;
        },

        child: ListView.builder(
          itemCount: 2 ,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return _buildProfileInfo();
            }
            Video video = Video(id: 'FHaObkHEkHQ', channelTitle: 'Kiddos World TV', title: 'Kids vocabulary - Family - family members & tree - Learn English educational video for kids', thumbnailUrl: 'https://i.ytimg.com/vi/FHaObkHEkHQ/maxresdefault.jpg');
            return _buildVideo(video);
          },
        ),
      )
          : Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            Theme.of(context).primaryColor, // Red
          ),
        ),
      ),
    );
  }
}


