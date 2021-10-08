import 'package:avatar_glow/avatar_glow.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class AudioScreen extends StatefulWidget {
  @override
  _AudioScreenState createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press the button and start speaking';

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
            builder: (context) => IconButton(
              icon: const Icon(Icons.content_copy),
              onPressed: () async {
                await FlutterClipboard.copy(_text);


                Scaffold.of(context).showSnackBar(
                  const SnackBar(content: Text('✓   Copied to Clipboard')),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Container(
            width: 360,
            height: 200,
            color: Colors.lightGreenAccent,
            child: SingleChildScrollView(
              reverse: false,
              child: Container(
                padding: const EdgeInsets.all(30).copyWith(bottom: 150),
                child: Text(
                  _text,
                  style: const TextStyle(
                    fontSize: 38,
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 360,
            height: 200,
            color: Colors.greenAccent,


          ),

        ],
      ),
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
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }
}
