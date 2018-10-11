import 'package:flutter/material.dart';
import 'package:estiam_doctor_client/models/kebab.dart';

class KebabDetailsHeader extends StatelessWidget {
  final Kebab kebab;

  /// Constructor
  KebabDetailsHeader(this.kebab);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.only(bottom: 140.0)
        )
      ],
    );
  }
}