import 'package:avatar_glow/avatar_glow.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:lemmatizer/lemmatizer.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:sprints_naid_flutter/tokenizer.dart';



class AudioScreen extends StatefulWidget {
  @override
  _AudioScreenState createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  List<String> stopWords = ['is','am','are','was','were','wasn','be','has','does','shouldn','for','its',"haven't","wouldn't",'weren',"it’s"];

  Lemmatizer lemmatizer = new Lemmatizer();
  Tokenizer t = Tokenizer();
  late String gif;


  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70.withOpacity(0.8),
        appBar: AppBar(
          title: const Text('Audio Converter'),
          actions: [
            Builder(
              builder: (context) =>
                  IconButton(
                    icon: const Icon(Icons.content_copy),
                    onPressed: () async {
                      await FlutterClipboard.copy(_text);


                      Scaffold.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('✓   Copied to Clipboard')),
                      );
                    },
                  ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AvatarGlow(
          animate: _isListening,
          endRadius: 70,
          duration: const Duration(milliseconds: 2000),
          repeatPauseDuration: const Duration(milliseconds: 100),
          repeat: true,
          glowColor: Colors.red,
          child: FloatingActionButton(
            shape: const StadiumBorder(
              side: BorderSide(color: Colors.yellowAccent, width: 1.5),
            ),
            child: Icon(
              _isListening ? Icons.mic_none_sharp : Icons.mic_sharp,
              size: 32,
            ),
            onPressed: _speaking,
          ),
        ),
        body: Center(child: SingleChildScrollView(
          reverse: true,
          child: Container(
            padding: const EdgeInsets.all(30).copyWith(bottom: 150),
            child: Column(
              children: [ Text(
                _text,
                style: const TextStyle(
                  fontSize: 38,
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                ),
              ),
                Container(alignment: Alignment.center,
                  height: 250,
                  width: 250,
                  child: gif != null
                      ? Image(
                    image: AssetImage('assets/$gif.gif'), fit: BoxFit.fill,)
                      : null,
                )

              ],
            ),
          ),
        )
        )
    );
  }

  void _speaking() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (e) => print('Error: $e'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) =>
              setState(() {
                _text = val.recognizedWords;

                print(_text);
                textToSl(_text);
              }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  textToSl(String text) async {
    List<String> tmp_words = [];
    tmp_words = t.tokenize(text.toLowerCase());
    List<String> lemmas = [];

    for (String w in tmp_words) {
      if (!(stopWords.contains(w))) {
        lemmas.add(lemmatizer.lemma(w).toLowerCase());
        setState(() {
          gif = lemmatizer.lemma(w).toLowerCase().replaceAll(
              new RegExp(r'[^\w\s]+'), '');
        });
      }
      await Future.delayed(  Duration(milliseconds: 1250 ));
    }
  }
}
