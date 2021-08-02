import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/FitnessManagementOverviewScreen/components/InnerStepContainer.dart';
import 'package:wellyfe_app/Screen/FitnessManagementOverviewScreen/components/TitleDataMonth.dart';

class StepsContainer extends StatelessWidget {
  const StepsContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        width: size.width * 0.8,
        height: size.height * 0.3,
        decoration: BoxDecoration(
          color: Color(0XFF534597),
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        child: Column(
          children: [
            InnerStepContainer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TitleDataMonth(
                  title: "Total Time",
                  data: "758",
                ),
                TitleDataMonth(
                  title: "Total Steps",
                  data: "9158",
                ),
                TitleDataMonth(
                  title: "Average Steps",
                  data: "758",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}