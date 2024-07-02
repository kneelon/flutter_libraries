import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class LocalizationPage extends StatefulWidget {
  final String pageTitle;
  const LocalizationPage({super.key, required this.pageTitle});

  @override
  State<LocalizationPage> createState() => _LocalizationPageState();
}

class _LocalizationPageState extends State<LocalizationPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitle),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Localizations.override(
              context: context,
              locale: const Locale('fil'),
              child: Builder(
                builder: (context) {
                  return Text(AppLocalizations.of(context)!.helloWorld);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
