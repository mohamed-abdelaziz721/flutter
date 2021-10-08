import 'package:flutter/material.dart';
import 'package:sprints_naid_flutter/tokenizer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:lemmatizer/lemmatizer.dart';

class VideoCaptionGIF extends StatefulWidget {
  final String id;
  const VideoCaptionGIF({required this.id});

  @override
  _VideoCaptionGIFState createState() => _VideoCaptionGIFState();
}

class _VideoCaptionGIFState extends State<VideoCaptionGIF> {
  List<String> stopWords = ['wasn', 'wouldn', 'be', 'has', 'that', 'does', 'shouldn', "you've", 'for', "didn't", 'm', 'ain', 'haven', "weren't", 'are', "she's", "wasn't", 'its', "haven't", "wouldn't", 'don', 'weren', 's', "you'd", "don't", 'doesn', "hadn't", 'is', 'was', "that'll", "should've", 'a', 'then', 'the', 'mustn', 'nor', 'as', 'it\'s', "needn't", 'd', 'am', 'have', 'hasn', 'o', "aren't", "you'll", "couldn't", "you're", "mustn't", 'didn', "doesn't", 'll', 'an', 'hadn', 'whom', 'y', "hasn't", 'itself', 'couldn', 'needn', "shan't", 'isn', "shouldn't", 'aren', 'being', 'were', 'did', 'ma', 't', 'having', 'mightn', 've', 'oh,', "won't", 'too.', "it’s"
  ];

  late YoutubePlayerController _controller;

  Lemmatizer lemmatizer = Lemmatizer();
  Tokenizer t = Tokenizer();

  String cc = "";
  String gif = 'assets/welcome.gif';
  bool _isLoading = false;

  Future<void> getCaption(String id) async {

    await Future.delayed(Duration(milliseconds: 5000));

    final yt = YoutubeExplode();
    var manifest = await yt.videos.closedCaptions.getManifest(widget.id);
    var trackInfo = manifest.getByLanguage('en');

    var tt = trackInfo.iterator;

    if (trackInfo != null) {
      print("got trackInfo");

      while (tt.moveNext()) {
        print("captions available");
        var track = await yt.videos.closedCaptions.get(tt.current);

        // captions = track.toJson();


        for (var e in track.captions) {
          List<String> tmp_words = [];
          List<String> lemmas = [];
          String sen = e.text;
          print(sen);
          // int offset = e.offset.inSeconds; //time offset
          // int end = e.end.inSeconds; //Time at which this caption ends being displayed.
          int duration = e.duration.inMilliseconds ;

          tmp_words = t.tokenize(sen.toLowerCase());

          for (String w in tmp_words) {
            if (!(stopWords.contains(w))) {
              //print(w);
              lemmas.add(lemmatizer.lemma(w).toLowerCase());
              setState(() {
                cc = sen; //original capions
                //cc = lemmas.join(" "); // captions without stop words
                gif = lemmatizer
                    .lemma(w)
                    .toLowerCase()
                    .replaceAll(new RegExp(r'[^\w\s]+'), '');
              });

              await Future.delayed(Duration(
                  milliseconds: (duration / tmp_words.length).toInt()));
            }
            await Future.delayed(Duration(milliseconds: 445));
          }
          // print(lemmas);
          // print(lemmas.join(" "));
        }
      }
    }

    yt.close();
    // return track.captions;
  }


  Future<void> Sync(String id) async {
    _controller.play();
    await getCaption(widget.id);

  }

  @override
  void initState() {
    super.initState();
    _isLoading = true;

    // getCaption(widget.id);

    _controller = YoutubePlayerController(
      initialVideoId: widget.id,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        captionLanguage: 'en',
        enableCaption: true,
      ),
    );
    _isLoading = false;


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _isLoading == false
          ? Column(
              children: [
                YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  onReady: () {
                    print('Player is ready.');
                  },
                ),
                const SizedBox(height: 5),
                MaterialButton(
                  minWidth: double.infinity,
                  height: 30,
                  onPressed: () {
                    // Sync(widget.id);
                    // play video

                    _controller.play();
                    getCaption(widget.id);
                  },
                  color: const Color(0xff0095FF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: const Text(
                    "Get Caption and Play video",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),
                Container(
                  width: 300,
                  height: 90,
                  color: Colors.grey,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    //.horizontal
                    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                    child: Text(
                      'Subtitles:\n\n$cc',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                        width: 300,
                        height: 200,
                        alignment: Alignment.center,
                        child: Image(
                          image: AssetImage('assets/$gif.gif'),
                          fit: BoxFit.fill,
                        )))
              ],
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
