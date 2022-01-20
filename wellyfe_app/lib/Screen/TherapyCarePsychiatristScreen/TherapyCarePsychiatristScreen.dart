import 'package:flutter/material.dart';
import 'package:wellyfe_app/Core/Model/Doctor.dart';
import 'package:wellyfe_app/Screen/TherapyCarePsychiatristScreen/components/Body.dart';

class TherapyCarePsychiatristScreen extends StatelessWidget {
  final String doctorID;
  final String imageUrl;

  const TherapyCarePsychiatristScreen({
    Key? key,
    required this.doctorID,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        doctor: Doctor.getDoctor(doctorID),
        imageUrl: imageUrl,
      ),
    );
  }
}
