import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellyfe_app/Core/Model/Doctor.dart';
import 'package:wellyfe_app/Screen/TherapyCarePsychiatristScreen/components/AppointmentButton.dart';
import 'package:wellyfe_app/Screen/TherapyCarePsychiatristScreen/components/QualificationsRow.dart';
import 'package:wellyfe_app/Screen/TherapyCarePsychiatristScreen/components/TopLevelBar.dart';
import 'package:wellyfe_app/Screen/TherapyCarePsychiatristScreen/components/Background.dart';

class Body extends StatelessWidget {
  final Doctor doctor;

  const Body({
    Key? key,
    required this.doctor
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
        children: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 100.0, 30.0, 10.0),
              child: TopLevelBar(),
            ),
            Container(
              height: size.height * 0.831,
              width: size.width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    child: Container(
                      height: size.height * 0.35,
                      width: size.width * 0.75,
                      child: Image(
                        image: AssetImage("assets/pictures/${doctor.gender}.png"),
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.3,
                    child: Container(
                      height: size.height * 0.85,
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Color(0XFFE7F0F9),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.0,
                            color: Colors.black.withOpacity(.25)
                          )
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Dr. " + doctor.name,
                              style: TextStyle(
                                fontSize: 30,
                                fontFamily: "NunitoSans",
                                color: Color(0XFF394D70),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "Specialist in ${doctor.specialisedTherapy.toLowerCase()} counselling",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: "NunitoSans",
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              doctor.graduateUniversity,
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: "NunitoSans",
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 75.0, vertical: 15.0),
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
                                        fontSize: 25,
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
                                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                                          child: Text(
                                            doctor.biography,
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              fontSize: 20,
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
                  ),
                ],
              ),
            )
          ],
        ),
    );
  }
}




