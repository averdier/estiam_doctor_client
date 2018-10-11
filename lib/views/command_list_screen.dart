import 'package:flutter/material.dart';
import 'package:estiam_doctor_client/views/components/main_drawer.dart';

class CommandListScreen extends StatelessWidget {

  /// Constructor
  CommandListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('Kebab App')
      ),
      body: new Center(
        child: new Text('Command list screen'),
      ),
      drawer: new MainDrawer(),
    );
  }
}