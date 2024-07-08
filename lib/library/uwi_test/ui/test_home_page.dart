
import 'package:flutter/material.dart';
import 'package:libraries/library/uwi_test/ui/unit.dart';
import 'package:libraries/library/uwi_test/ui/widget.dart';

class TestHomePage extends StatefulWidget {
  final String pageTitle;
  const TestHomePage({super.key, required this.pageTitle});

  @override
  State<TestHomePage> createState() => _TestHomePageState();
}

class _TestHomePageState extends State<TestHomePage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildElevatedButton(context, 'Unit Test'),
                _buildElevatedButton(context, 'Widget Test'),
                _buildElevatedButton(context, 'Integration Test'),
              ],
            ),
          ),

        ),
      ),
    );
  }

  Widget _buildElevatedButton(context, String text) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: ElevatedButton(onPressed: () {
          switch (text) {
            case 'Unit Test':
              Navigator.push(context, MaterialPageRoute(builder: (context) => const TestUnit(pageTitle: 'Unit Test')));
              break;
            case 'Widget Test':
              Navigator.push(context, MaterialPageRoute(builder: (context) => const TestWidget(pageTitle: 'Widget Test')));
              break;
            case 'Integration Test':
              Navigator.push(context, MaterialPageRoute(builder: (context) => const TestWidget(pageTitle: 'Integration Test')));
              break;
          }
        }, child: Text(text)),
      );
}
