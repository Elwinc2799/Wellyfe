import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wellyfe_app/Screen/TherapyCareDoctorListScreen/TherapyCareDoctorListScreen.dart';
import 'package:wellyfe_app/Screen/TherapyCareOverviewScreen/components/TherapyShortcutIndividual.dart';

class TherapyShortcut extends StatelessWidget {
  const TherapyShortcut({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> therapyList = [
      "Marriage", "Behavioural", "Child", "Eating Disorder", "Trauma",
    ];

    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.2,
      width: size.width * 0.8675,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 30.0),
          child: Row(
            children: [
              for (var i = 0; i < therapyList.length; i++)
                Row(
                  children: [
                    TherapyShortcutIndividual(
                      therapy: therapyList[i],
                      length: therapyList[i].length,
                      function: () {
                        Navigator.push(context, PageTransition(
                          type: PageTransitionType.fade,
                          child: TherapyCareDoctorListScreen(),
                        ));
                      },
                    ),
                    SizedBox(width: size.width * 0.05),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}