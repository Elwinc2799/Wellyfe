import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wellyfe_app/Screen/FitnessBreakfastScreen/FitnessBreakfastScreen.dart';
import 'package:wellyfe_app/Screen/FitnessIntakeOverviewScreen/components/MealContainerIndividual.dart';

class MealContainer extends StatelessWidget {
  const MealContainer({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MealContainerIndividual(
          meal: "Breakfast",
          calorie: "345",
          function: () {
            Navigator.push(context, PageTransition(
              type: PageTransitionType.fade,
              child: FitnessBreakfastScreen(),
            ));
          },
          isLeft: true,
          isRight: false,
        ),
        SizedBox(width: size.width * 0.05),
        MealContainerIndividual(
          meal: "Lunch",
          calorie: "345",
          function: () {},
          isLeft: false,
          isRight: false,
        ),
        SizedBox(width: size.width * 0.05),
        MealContainerIndividual(
          meal: "Dinner",
          calorie: "345",
          function: () {},
          isLeft: false,
          isRight: true,
        ),
      ],
    );
  }
}