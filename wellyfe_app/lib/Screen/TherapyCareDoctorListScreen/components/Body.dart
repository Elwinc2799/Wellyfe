import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wellyfe_app/Core/Model/Doctor.dart';
import 'package:wellyfe_app/Screen/TherapyCareDoctorListScreen/components/DoctorIndividualContainer.dart';
import 'package:wellyfe_app/Screen/TherapyCareDoctorListScreen/components/TopLevelBar.dart';
import 'package:wellyfe_app/Screen/TherapyCareOverviewScreen/components/Background.dart';
import 'package:wellyfe_app/Screen/TherapyCarePsychiatristScreen/TherapyCarePsychiatristScreen.dart';

class Body extends StatelessWidget {
  final List<Doctor> doctorList;
  final String specialisation;

  const Body({
    Key? key,
    required this.doctorList,
    required this.specialisation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      children: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.5, vertical: 75.0),
        child: Column(
          children: [
            TopLevelBar(therapy: specialisation),
            SizedBox(height: size.height * 0.1),
            Container(
              height: size.height * 0.6,
              width: size.width * 0.9,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(doctorList.length, (index) {
                    return Column(
                      children: [
                        DoctorIndividualContainer(
                          therapy: doctorList[index].specialisedTherapy,
                          name: "Dr. " + doctorList[index].name,
                          experience: doctorList[index].yearsExperience,
                          function: () {
                            Navigator.push(context, PageTransition(
                              type: PageTransitionType.fade,
                              child: TherapyCarePsychiatristScreen(
                                doctorID: doctorList[index].doctorID
                              ),
                            ));
                          },
                        ),
                        SizedBox(height: size.height * 0.025),
                      ],
                    );
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
