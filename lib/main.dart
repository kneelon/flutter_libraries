import 'package:flutter/material.dart';
import 'package:libraries/library/build_runner/build_runner_page.dart';
import 'package:libraries/library/country_picker/country_picker.dart';
import 'package:libraries/library/localization/localization_page.dart';
import 'package:libraries/library/pull_to_refresh/pull_to_refresh.dart';
import 'package:libraries/library/sqflite/sqf_lite_page.dart';
import 'package:libraries/library/voice_to_text/voice_to_text_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Libraries',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Homepage(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          title: const Text('Choose package'),
          leading: const SizedBox(),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            _buildLayers(context, 'Country picker'),
            _buildLayers(context, 'Pull to refresh'),
            _buildLayers(context, 'Voice to text'),
            _buildLayers(context, 'Build Runner'),
            _buildLayers(context, 'Localization'),
            _buildLayers(context, 'SQF Lite'),
          ],
        ),
      ),
    );
  }

  Widget _buildLayers(context, String text) =>
    GestureDetector(
      onTap: () {
        _onClickListener(context, text);
      },
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          width: double.infinity,
          height: 72,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(text, style: const TextStyle(fontSize: 20, color: Colors.lightBlue),),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
      ),
    );

  void _onClickListener(context, String title) {
    switch (title) {
      case 'Country picker':
        Navigator.push(context, MaterialPageRoute(builder: (context) => CountryPicker(pageTitle: title)));
        break;
      case 'Pull to refresh':
        Navigator.push(context, MaterialPageRoute(builder: (context) => PullToRefresh(pageTitle: title)));
        break;
      case 'Voice to text':
        Navigator.push(context, MaterialPageRoute(builder: (context) => VoiceToTextPage(pageTitle: title)));
        break;
      case 'Build Runner':
        Navigator.push(context, MaterialPageRoute(builder: (context) => BuildRunnerPage(pageTitle: title)));
        break;
      case 'Localization':
        Navigator.push(context, MaterialPageRoute(builder: (context) => LocalizationPage(pageTitle: title)));
        break;
      case 'SQF Lite':
        Navigator.push(context, MaterialPageRoute(builder: (context) => SqfLitePage(pageTitle: title)));
        break;

    }
  }
}


