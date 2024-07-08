
import 'package:flutter/material.dart';

class TestIntegration extends StatefulWidget {
  final String pageTitle;
  const TestIntegration({super.key, required this.pageTitle});

  @override
  State<TestIntegration> createState() => _TestIntegrationState();
}

class _TestIntegrationState extends State<TestIntegration> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.pageTitle),
        ),
      ),
    );
  }

}
