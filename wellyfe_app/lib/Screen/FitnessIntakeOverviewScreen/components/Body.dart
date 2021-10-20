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
        children: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(40.0, 75.0, 40.0, 20.0),
              child: TopLevelBar(),
            ),
            DietContainer(),
            SizedBox(height: size.height * 0.075),
            buildLeftSideBar(),
            SizedBox(height: size.height * 0.025),
            Text(
              "Meals today",
              style: TextStyle(
                fontSize: 22.5,
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
      ),
    );
  }

  Row buildLeftSideBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
    );
  }
}
