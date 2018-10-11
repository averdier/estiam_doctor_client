import 'package:flutter/material.dart';


class KebabDetailsScreen extends StatelessWidget {

  /// Constructor
  KebabDetailsScreen({Key key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Kebab app'),
      ),
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[

          ],
        ),
      )
    );
  }
}