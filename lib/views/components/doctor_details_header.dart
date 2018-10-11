import 'package:flutter/material.dart';
import 'package:estiam_doctor_client/models/doctor.dart';

class DoctorDetailsHeader extends StatelessWidget {
  final Doctor doctor;

  /// Constructor
  DoctorDetailsHeader(this.doctor);

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
