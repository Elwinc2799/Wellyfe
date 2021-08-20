import 'package:wellyfe_app/Core/Model/Appointment.dart';

class Doctor {
  final String name;
  final String gender;
  final String graduateUniversity;
  final int yearsExperience;
  final String specialiseTherapy;
  final int patientsHelped;
  final double ratings;
  final String biography;
  final List<Appointment> appointmentList;

  Doctor(
    this.name,
    this.gender,
    this.graduateUniversity,
    this.yearsExperience,
    this.specialiseTherapy,
    this.patientsHelped,
    this.ratings,
    this.biography,
    this.appointmentList,
  );
}