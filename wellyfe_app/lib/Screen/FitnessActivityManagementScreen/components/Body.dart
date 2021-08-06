import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/FitnessActivityManagementScreen/components/StepsBarChart.dart';
import 'package:wellyfe_app/Screen/FitnessActivityManagementScreen/components/StepsLowerContainer.dart';
import 'package:wellyfe_app/Screen/FitnessActivityManagementScreen/components/TopLevelBar.dart';
import 'package:wellyfe_app/Screen/FitnessManagementOverviewScreen/components/Background.dart';

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
            StepsBarChart(),
            SizedBox(height: size.height * 0.035),
            StepsLowerContainer(),
            SizedBox(height: size.height * 0.035),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                "Activity Dashboard",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: "NunitoSans",
                  color: Color(0XFF394D70),
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}

