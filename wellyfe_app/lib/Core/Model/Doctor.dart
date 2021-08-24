import 'package:wellyfe_app/Core/Model/Appointment.dart';

class Doctor {
  final String doctorID;
  final String name;
  final String gender;
  final String graduateUniversity;
  final int yearsExperience;
  final String specialisedTherapy;
  final int patientsHelped;
  final double ratings;
  final String biography;
  late final List<Appointment> appointmentList;

  Doctor(
    this.doctorID,
    this.name,
    this.gender,
    this.graduateUniversity,
    this.yearsExperience,
    this.specialisedTherapy,
    this.patientsHelped,
    this.ratings,
    this.biography,
  );

  static List<Doctor> doctorDataList = [];

  static List<Doctor> specificDoctorList(String specialisation) {
    return doctorDataList.where(
      (element) => (element.specialisedTherapy == (specialisation))
    ).toList();
  }

  static Doctor getDoctor(String doctorID) {
    return doctorDataList.firstWhere(
      (element) => (element.doctorID == (doctorID))
    );
  }
}