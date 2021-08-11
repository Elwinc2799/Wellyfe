import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wellyfe_app/Screen/FitnessIntakeOverviewScreen/FitnessIntakeOverviewScreen.dart';
import 'package:wellyfe_app/Screen/FitnessManagementOverviewScreen/components/Background.dart';
import 'package:wellyfe_app/Screen/FitnessManagementOverviewScreen/components/FitnessOverviewIndividual.dart';
import 'package:wellyfe_app/Screen/FitnessManagementOverviewScreen/components/GoalsButton.dart';
import 'package:wellyfe_app/Screen/FitnessManagementOverviewScreen/components/RemainingCalories.dart';
import 'package:wellyfe_app/Screen/FitnessManagementOverviewScreen/components/TopLevelBar.dart';
import 'package:wellyfe_app/Screen/FitnessWeightManagementScreen/FitnessWeightManagementScreen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      children: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopLevelBar(),
            SizedBox(height: size.height * 0.075),
            RemainingCalories(),
            SizedBox(height: size.height * 0.075),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FitnessOverviewIndividual(
                  title: "Intake",
                  image: "assets/logo/appleFood.png",
                  firstData: "928",
                  firstUnit: "kcal",
                  firstPercentage: 0.4,
                  firstColor: Color(0XFF15e7c2),
                  secondData: "46.9",
                  secondUnit: "fat g",
                  secondPercentage: 0.2,
                  secondColor: Color(0XFF1D80F3),
                  function: () {
                    Navigator.push(context, PageTransition(
                      type: PageTransitionType.fade,
                      child: FitnessIntakeOverviewScreen(),
                    ));
                  },
                ),
                FitnessOverviewIndividual(
                  title: "Burnt",
                  image: "assets/logo/flame.png",
                  firstData: "1928",
                  firstUnit: "kcal",
                  firstPercentage: 0.6,
                  firstColor: Color(0XFFC9DFEE),
                  secondData: "5239",
                  secondUnit: "steps",
                  secondPercentage: 1,
                  secondColor: Color(0XFF68F8D6),
                  function: () {
                    Navigator.push(context, PageTransition(
                      type: PageTransitionType.fade,
                      child: FitnessWeightManagementScreen(),
                    ));
                  },
                ),
              ],
            ),
            SizedBox(height: size.height * 0.075),
            GoalsButton(),
          ],
        ),
      ),
    );
  }
}






