import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellyfe_app/Core/Model/Doctor.dart';
import 'package:wellyfe_app/Screen/TherapyCarePsychiatristScreen/components/DoctorLowContainer.dart';
import 'package:wellyfe_app/Screen/TherapyCarePsychiatristScreen/components/DoctorProfileInfo.dart';
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
              padding: const EdgeInsets.fromLTRB(17.5, 75.0, 17.5, 0.0),
              child: TopLevelBar(),
            ),
            Container(
              height: size.height * 0.85,
              width: size.width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    child: Image(
                      image: AssetImage("assets/pictures/doctor1.png"),
                      height: size.height * 0.35,
                      width: size.width * 0.85,
                    ),
                  ),
                  DoctorLowContainer(
                    doctor: doctor,
                  ),
                  DoctorProfileInfo(
                    name: doctor.name,
                    specialist: doctor.specialisedTherapy.toLowerCase(),
                    university: doctor.graduateUniversity,
                  ),
                ],
              ),
            )
          ],
        ),
    );
  }
}






