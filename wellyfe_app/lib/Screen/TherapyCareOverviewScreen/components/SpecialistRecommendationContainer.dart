import 'package:flutter/material.dart';
import 'dart:math';

import 'package:page_transition/page_transition.dart';
import 'package:wellyfe_app/Core/Model/Doctor.dart';
import 'package:wellyfe_app/Screen/TherapyCareOverviewScreen/components/SpecialistRecommendationContainerIndividual.dart';
import 'package:wellyfe_app/Screen/TherapyCarePsychiatristScreen/TherapyCarePsychiatristScreen.dart';

class SpecialistRecommendationContainer extends StatelessWidget {
  const SpecialistRecommendationContainer({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String imageUrl = "assets/pictures/doctor";

    return Container(
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: size.height * 0.275,
            width: size.width * 0.875,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0XFFB7BDF3).withOpacity(0.75),
                    Color(0XFFB7BDF3).withOpacity(0.2),
                  ],
                  stops: [
                    0.1,
                    1,
                  ]
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 100,
                  left: -45,
                  child: Transform.rotate(
                    angle: 270 * pi / 180,
                    child: Text(
                      "Our Counsellors",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "NunitoSans",
                        color: Color(0XFF394D70),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 60,
                  top: 20,
                  child: Container(
                    width: size.width * 0.8,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(Doctor.doctorDataList.length, (index) {
                              return SpecialistRecommendationContainerIndividual(
                                doctor: Doctor.doctorDataList[index],
                                imageUrl: imageUrl + (index+1).toString() + ".png",
                                function: () {
                                  Navigator.push(context, PageTransition(
                                    type: PageTransitionType.fade,
                                    child: TherapyCarePsychiatristScreen(
                                      doctorID: Doctor.doctorDataList[index].doctorID,
                                      imageUrl: imageUrl + (index+1).toString() + ".png",
                                    ),
                                  ));
                                },
                              );
                            }),
                          ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}