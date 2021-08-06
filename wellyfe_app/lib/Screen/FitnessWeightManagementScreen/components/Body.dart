import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/FitnessManagementOverviewScreen/components/Background.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 100.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopLevelBar(),
              SizedBox(height: size.height * 0.05),
              WeightContainer(),
              SizedBox(height: size.height * 0.05),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    CaloriesBurntContainer(),
                    SizedBox(width: size.width * 0.05),
                    WaterIntakeContainer(),
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }
}



