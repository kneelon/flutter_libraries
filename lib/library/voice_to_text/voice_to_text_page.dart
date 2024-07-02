
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:voice_to_text/voice_to_text.dart';

class VoiceToTextPage extends StatefulWidget {
  final String pageTitle;
  const VoiceToTextPage({super.key, required this.pageTitle});

  @override
  State<VoiceToTextPage> createState() => _VoiceToTextPageState();
}

class _VoiceToTextPageState extends State<VoiceToTextPage> {

  late VoiceToText _voiceToText;
  String _text = 'Press the button and start speaking';

  @override
  void initState() {
    super.initState();
    _voiceToText = VoiceToText();
    _voiceToText.addListener(_onSpeechResult);
    _initializeSpeech();
  }

  void _initializeSpeech() {
    _voiceToText.initSpeech();
    setState(() {});
  }

  void _onSpeechResult() {
    setState(() {
      _text = _voiceToText.speechResult;
    });
  }

  void _startListening() {
    _voiceToText.startListening();
  }

  void _stopListening() {
    _voiceToText.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
            onTap: () {
              setState(() {
                _text = 'Voice';
              });
            },
            child: Text(widget.pageTitle)),
      ),
      body: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                _text = 'Clicked';
              });
            },
              //child: Text(_text.isEmpty ? 'Darwin Lumampao' : _text)),
              child: Text(_text)),
          const SizedBox(height: 20),
          FloatingActionButton(
            onPressed: _voiceToText.isListening ? _stopListening : _startListening,
            tooltip: 'Listen',
            child: Icon(_voiceToText.isListening ? Icons.mic : Icons.mic_none),
          ),
        ],
      ),
    );
  }
}
