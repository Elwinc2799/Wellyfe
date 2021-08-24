import 'package:flutter/material.dart';
import 'package:wellyfe_app/Core/Model/Doctor.dart';
import 'package:wellyfe_app/Screen/TherapyCareDoctorListScreen/components/Body.dart';

class TherapyCareDoctorListScreen extends StatelessWidget {
  final String specialisation;

  const TherapyCareDoctorListScreen({
    Key? key,
    required this.specialisation
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        doctorList: Doctor.specificDoctorList(specialisation),
        specialisation: specialisation,
      ),
    );
  }
}
