import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/FitnessMealsScreen/components/IngredientsContainer.dart';
import 'package:wellyfe_app/Screen/FitnessMealsScreen/components/TimeCalorieContainer.dart';
import 'package:wellyfe_app/Screen/FitnessMealsScreen/components/TopLevelBar.dart';
import 'package:wellyfe_app/Screen/FitnessManagementOverviewScreen/components/Background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      children: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: TopLevelBar(),
            ),
            SizedBox(height: size.height * 0.05),
            Stack(
              children: [
                Column(
                  children: [
                    SizedBox(height: size.height * 0.3),
                    Container(
                      height: size.height * 0.509,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Color(0XFFF4F9FF),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(150.0)
                        ),
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
                      child: Padding(
                        padding: const EdgeInsets.only(top: 125, left: 25.0, right: 25.0),
                        child: Column(
                          children: [
                            Text(
                              "Avocado Egg with Slices of Apples and Cucumber",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: "NunitoSans",
                                color: Color(0XFF394D70),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(45.0, 10.0, 45.0, 30.0),
                              child: Divider(
                                thickness: 0.75,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IngredientsContainer(
                                  ingredients: [
                                    "Avocado",
                                    "Eggs",
                                    "Apples",
                                    "Cucumbers",
                                  ],
                                ),
                                TimeCalorieContainer(
                                  time: 15,
                                  calories: 300,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: size.height * 0.4,
                      width: size.width * 0.75,
                      child: Image(
                        image: AssetImage("assets/pictures/avocadoEgg.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}



