import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/FitnessIntakeOverviewScreen/components/Background.dart';
import 'package:wellyfe_app/Screen/FitnessIntakeOverviewScreen/components/DietContainer.dart';
import 'package:wellyfe_app/Screen/FitnessIntakeOverviewScreen/components/MealsContainer.dart';
import 'package:wellyfe_app/Screen/FitnessIntakeOverviewScreen/components/MealsRadioClass.dart';
import 'package:wellyfe_app/Screen/FitnessIntakeOverviewScreen/components/MealsRadioItem.dart';
import 'package:wellyfe_app/Screen/FitnessIntakeOverviewScreen/components/TopLevelBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wellyfe_app/Core/Model/Food.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var firebaseUser =  FirebaseAuth.instance.currentUser;
  final firestoreInstance = FirebaseFirestore.instance;

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

  String _selected = "breakfast";

  @override
  Widget build(BuildContext context) {
    List<Food> mealsList = Food.mealsCategoryList(_selected.toLowerCase());

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
            DietContainer(mealsList: mealsList),
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
              mealsList: mealsList,
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
              _selected = _selected.toLowerCase();
            });
          },
          child: MealsRadioItem(item: mealsTypeList[index]),
        )
      )
    );
  }
}
