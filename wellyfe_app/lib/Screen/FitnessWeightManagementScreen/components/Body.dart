import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/FitnessManagementOverviewScreen/components/Background.dart';
import 'package:wellyfe_app/Screen/FitnessWeightManagementScreen/components/BMIContainer.dart';
import 'package:wellyfe_app/Screen/FitnessWeightManagementScreen/components/CaloriesBurntContainer.dart';
import 'package:wellyfe_app/Screen/FitnessWeightManagementScreen/components/TopLevelBar.dart';
import 'package:wellyfe_app/Screen/FitnessWeightManagementScreen/components/WaterIntakeContainer.dart';
import 'package:wellyfe_app/Screen/FitnessWeightManagementScreen/components/WeightContainer.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
        children: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 75.0, 20.0, 0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopLevelBar(),
                SizedBox(height: size.height * 0.04),
                WeightContainer(),
                SizedBox(height: size.height * 0.025),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      CaloriesBurntContainer(),
                      SizedBox(width: size.width * 0.05),
                      WaterIntakeContainer(),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.025),
                BMIContainer(),
              ],
            ),
          ),
        ),
    );
  }
}




