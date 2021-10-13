import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/FitnessWeightManagementScreen/components/WeightLineChart.dart';

class WeightContainer extends StatelessWidget {
  const WeightContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        height: size.height * 0.37,
        width: size.width * 0.8,
        decoration: BoxDecoration(
            color: Color(0XFFF4F9FF),
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            boxShadow: [
              BoxShadow(
                  blurRadius: 5.0,
                  offset: Offset(-3, -3),
                  color: Colors.grey.withOpacity(0.1)
              ),
              BoxShadow(
                  blurRadius: 5.0,
                  offset: Offset(3, 3),
                  color: Colors.black.withOpacity(.25)
              )
            ]
        ),
        child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 2.0),
              child: Column(
                children: [
                  Text(
                    "WEIGHT",
                    style: TextStyle(
                      fontSize: 17.5,
                      fontFamily: "NunitoSans",
                      color: Colors.grey.shade500.withOpacity(0.5),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: size.height * 0.025),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "67.8",
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: "NunitoSans",
                            color: Color(0XFF394D70),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: " kg",
                          style: TextStyle(
                            fontSize: 17.5,
                            fontFamily: "NunitoSans",
                            color: Colors.grey.shade500.withOpacity(0.75),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ]
                    ),
                  ),
                  SizedBox(height: size.height * 0.025),
                  WeightLineChart(),
                ],
              ),
            )
        ),
      ),
    );
  }
}