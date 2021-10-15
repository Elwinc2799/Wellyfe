import 'package:flutter/material.dart';
import 'package:wellyfe_app/Core/Model/Doctor.dart';
import 'package:wellyfe_app/Screen/TherapyCarePsychiatristScreen/components/AppointmentButton.dart';
import 'package:wellyfe_app/Screen/TherapyCarePsychiatristScreen/components/QualificationsRow.dart';

class DoctorLowContainer extends StatelessWidget {
  const DoctorLowContainer({
    Key? key,
    required this.doctor,
  }) : super(key: key);

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Positioned(
      top: size.height * 0.35,
      child: Container(
        height: size.height * 0.8,
        width: size.width,
        decoration: BoxDecoration(
            color: Color(0XFFFBFDFF),
            borderRadius: BorderRadius.circular(20.0)
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 75.0, vertical: 5),
                child: Divider(
                  thickness: 1,
                ),
              ),
              Container(
                height: size.height * 0.4,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Text(
                        "About",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "NunitoSans",
                          color: Color(0XFF394D70),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        height: size.height * 0.15,
                        width: size.width * 0.85,
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 7.5),
                            child: Text(
                              doctor.biography,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "NunitoSans",
                                color: Color(0XFF394D70),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.005),
                      QualificationsRow(
                        patients: doctor.patientsHelped,
                        yearsExp: doctor.yearsExperience,
                        ratings: doctor.ratings,
                      ),
                      SizedBox(height: size.height * 0.03),
                      AppointmentButton()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
