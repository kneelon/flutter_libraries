
import 'package:flutter/material.dart';

class BuildRunnerPage extends StatefulWidget {
  final String pageTitle;
  const BuildRunnerPage({super.key, required this.pageTitle});

  @override
  State<BuildRunnerPage> createState() => _BuildRunnerPageState();
}

class _BuildRunnerPageState extends State<BuildRunnerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitle),
      ),
      body: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('How to use build_runner?'),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Add packages, build_runner, json_annotation and json_serializable'),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Create a simple model class'),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Below imports add part 'user_model.dart.g.dart'"),
            ),
            Text(r"factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);"),
            Text(r"Map<String, dynamic> toJson() => _$UserModelToJson(this);"),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Then run the command flutter pub run build_runner build --delete-conflicting-outputs"),
            ),
          ],
        ),
      ),
    );
  }
}
