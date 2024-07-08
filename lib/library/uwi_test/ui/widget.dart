
import 'package:flutter/material.dart';

class TestWidget extends StatefulWidget {
  final String pageTitle;
  const TestWidget({super.key, required this.pageTitle});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
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
