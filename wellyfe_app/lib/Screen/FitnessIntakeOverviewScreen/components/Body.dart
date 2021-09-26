import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/FitnessIntakeOverviewScreen/components/Background.dart';
import 'package:wellyfe_app/Screen/FitnessIntakeOverviewScreen/components/DietContainer.dart';
import 'package:wellyfe_app/Screen/FitnessIntakeOverviewScreen/components/MealsContainer.dart';
import 'package:wellyfe_app/Screen/FitnessIntakeOverviewScreen/components/MealsRadioClass.dart';
import 'package:wellyfe_app/Screen/FitnessIntakeOverviewScreen/components/MealsRadioItem.dart';
import 'package:wellyfe_app/Screen/FitnessIntakeOverviewScreen/components/TopLevelBar.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<bool> _onWillPop() async {
    return true;
  }

  List<MealsRadioClass> mealsTypeList = [];

  @override
  void initState() {
    super.initState();
    mealsTypeList.add(new MealsRadioClass("Breakfast", true));
    mealsTypeList.add(new MealsRadioClass("Lunch", false));
    mealsTypeList.add(new MealsRadioClass("Dinner", false));
  }

  String _selected = "Breakfast";



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Background(
        children: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(40.0, 75.0, 40.0, 20.0),
                  child: TopLevelBar(),
                ),
                // Container(
                //   height: size.height * 0.45,
                //   width: size.width,
                //   child: Stack(
                //     children: [
                //       Positioned(
                //         top: -70,
                //         right: -300,
                //         child: Transform.rotate(
                //           angle: pi,
                //           child: Container(
                //             height: 650,
                //             width: 650,
                //             child: Image(
                //               image: AssetImage("assets/pictures/breakfast.png"),
                //             ),
                //           ),
                //         ),
                //       ),
                //       CalContainer(),
                //     ],
                //   ),
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.symmetric(horizontal: 30.0),
                //       child: Text(
                //         "Meals today",
                //         style: TextStyle(
                //           fontSize: 30,
                //           fontFamily: "NunitoSans",
                //           color: Color(0XFF394D70),
                //           fontWeight: FontWeight.w700,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: size.height * 0.025),
                // MealContainer(),
              ],
            ),
            buildLeftSideBar(),
            Positioned(
              top: 200,
              left: 150,
              child: Container(
                width: size.width * 0.775,
                height: size.height * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DietContainer(),
                    SizedBox(height: size.height * 0.075),
                    Text(
                      "Meals today",
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: "NunitoSans",
                        color: Color(0XFF394D70),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    MealsContainer(
                      category: _selected,
                    )
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }

  Positioned buildLeftSideBar() {
    return Positioned(
      left: -240,
      bottom: 500,
      child: Transform.rotate(
        angle: pi / 2 + pi,
        child: Row(
          children: List.generate(mealsTypeList.length, (index) =>
            GestureDetector(
              onTap: () {
                setState(() {
                  mealsTypeList.forEach((element) => element.isSelected = false);
                  mealsTypeList[index].isSelected = true;
                  _selected = mealsTypeList[index].text;
                });
              },
              child: MealsRadioItem(item: mealsTypeList[index]),
            )
          )
        ),
      ),
    );
  }
}






