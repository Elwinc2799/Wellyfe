import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellyfe_app/Core/Data/RecommendedActivity.dart';
import 'package:wellyfe_app/Screen/FitnessActivityManagementScreen/components/ActivityRecommendationIndividual.dart';

class ActivityRecommendationsMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Container(
        height: size.height * 0.225,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children:
              List.generate(RecommendedActivity.recommendedList.length, (i) {
                return Row(
                  children: [
                    ActivityRecommendationsIndividual(
                      activity: RecommendedActivity.recommendedList[i].activity,
                      icon: RecommendedActivity.recommendedList[i].icon,
                      duration: RecommendedActivity.recommendedList[i].duration,
                    ),
                    SizedBox(width: size.width * 0.05),
                  ],
                );
              })

          ),
        ),
      ),
    );
  }
}

