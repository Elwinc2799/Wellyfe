import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/TherapyCareOverviewScreen/components/SpecialistRecommendationContainerIndividual.dart';

class SpecialistRecommendationContainer extends StatelessWidget {
  const SpecialistRecommendationContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.2,
      width: size.width * 0.95,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpecialistRecommendationContainerIndividual(
                therapy: "Behavioral",
                name: "Dr. Sarah Anderson",
                experience: 9,
              ),
              SizedBox(height: size.height * 0.025),
              SpecialistRecommendationContainerIndividual(
                therapy: "Behavioral",
                name: "Dr. Sarah Anderson",
                experience: 9,
              ),
            ],
          ),
        ),
      ),
    );
  }
}