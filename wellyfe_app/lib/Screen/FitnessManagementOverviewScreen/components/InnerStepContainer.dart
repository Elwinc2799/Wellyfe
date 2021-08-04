import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/FitnessManagementOverviewScreen/components/StepsLineChart.dart';

class InnerStepContainer extends StatelessWidget {
  const InnerStepContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.8,
      height: size.height * 0.2,
      decoration: BoxDecoration(
        color: Color(0XFF7163BA),
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        border: Border.all(
          color: Color(0XFF7A6EB5),
          width: 5,
        )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Overview",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Nunito",
                        fontSize: 17.5,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                  Container(
                    width: size.width * 0.175,
                    height: size.height * 0.03,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.white,
                            width: 3
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Center(
                      child: Text(
                        "Monthly",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Nunito",
                            fontSize: 17.5,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            StepsLineChart(),
          ],
        ),
      ),
    );
  }
}