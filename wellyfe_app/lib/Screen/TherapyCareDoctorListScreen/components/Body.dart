import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wellyfe_app/Screen/TherapyCareDoctorListScreen/components/DoctorIndividualContainer.dart';
import 'package:wellyfe_app/Screen/TherapyCareDoctorListScreen/components/TopLevelBar.dart';
import 'package:wellyfe_app/Screen/TherapyCareOverviewScreen/components/Background.dart';
import 'package:wellyfe_app/Screen/TherapyCarePsychiatristScreen/TherapyCarePsychiatristScreen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      children: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 100.0),
        child: Column(
          children: [
            TopLevelBar(therapy: "M A R R I A G E"),
            SizedBox(height: size.height * 0.1),
            Container(
              height: size.height * 0.6,
              width: size.width * 0.85,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    DoctorIndividualContainer(
                      therapy: "Marriage",
                      name: "Dr. Peter Parker",
                      experience: 9,
                      function: () {
                        Navigator.push(context, PageTransition(
                          type: PageTransitionType.fade,
                          child: TherapyCarePsychiatristScreen(),
                        ));
                      },
                    ),
                    SizedBox(height: size.height * 0.025),
                    DoctorIndividualContainer(
                      therapy: "Marriage",
                      name: "Dr. Peter Parker",
                      experience: 9,
                      function: () {
                        Navigator.push(context, PageTransition(
                          type: PageTransitionType.fade,
                          child: TherapyCarePsychiatristScreen(),
                        ));
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
