import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/FitnessManagementOverviewScreen/components/Background.dart';
import 'package:wellyfe_app/Screen/FitnessManagementOverviewScreen/components/FitnessOverviewIndividual.dart';
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
                  image: "assets/logo/food.png",
                  firstData: "928",
                  firstUnit: "kcal",
                  firstPercentage: 0.4,
                  firstColor: Colors.teal,
                  secondData: "46.9",
                  secondUnit: "fat g",
                  secondPercentage: 0.2,
                  secondColor: Colors.yellow.shade600,
                  function: () {},
                ),
                FitnessOverviewIndividual(
                  title: "Burnt",
                  image: "assets/logo/burnt.png",
                  firstData: "1928",
                  firstUnit: "kcal",
                  firstPercentage: 0.6,
                  firstColor: Colors.orange.shade400,
                  secondData: "5239",
                  secondUnit: "steps",
                  secondPercentage: 1,
                  secondColor: Colors.greenAccent,
                  function: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return FitnessWeightManagementScreen();
                        }
                    ));
                  },
                ),
              ],
            ),
            SizedBox(height: size.height * 0.075),
            Center(
              child: Container(
                width: size.width * 0.5,
                height: size.height * 0.05,
                decoration: BoxDecoration(
                  color: Color(0XFFF4F9FF),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
                child: GestureDetector(
                  onTap: () {},
                  child: Center(
                    child: Text(
                      "Set Your Goals",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: "NunitoSans",
                        color: Colors.black.withOpacity(0.3),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}






