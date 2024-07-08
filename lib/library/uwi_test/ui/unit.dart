
import 'package:flutter/material.dart';
import 'package:libraries/library/uwi_test/test/unit/counter.dart';

class TestUnit extends StatefulWidget {
  final String pageTitle;
  const TestUnit({super.key, required this.pageTitle});

  @override
  State<TestUnit> createState() => _TestUnitState();
}

class _TestUnitState extends State<TestUnit> {

  final Counter _counter = Counter();

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
                Text('Counter ${_counter.count}'),
                const SizedBox(height: 32),
                _buildElevatedButton(context, 'Click to increment'),
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
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              _counter.incrementCounter();
            });
        }, child: Text(text)),
      );
}
