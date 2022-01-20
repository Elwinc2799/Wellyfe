import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellyfe_app/Core/Model/Food.dart';
import 'package:wellyfe_app/Screen/FitnessIntakeOverviewScreen/components/CategoryData.dart';

class DietContainer extends StatelessWidget {

  const DietContainer({
    Key? key,
    required this.mealsList,
  }) : super(key: key);

  final List<Food> mealsList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mealsList[1].foodName,
            style: TextStyle(
              fontSize: 22.5,
              fontFamily: "NunitoSans",
              color: Colors.black.withOpacity(0.75),
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            children: [
              Image(
                image: AssetImage("assets/logo/flame.png"),
                height: size.height * 0.06,
                width: size.width * 0.06
              ),
              Text(
                mealsList[1].calories.toString() + " kcal",
                style: TextStyle(
                  fontSize: 22.5,
                  fontFamily: "NunitoSans",
                  color: Colors.black.withOpacity(0.3),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),

          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CategoryData(
                    category: "Carb",
                    data: mealsList[1].carbs.toString(),
                  ),
                  CategoryData(
                    category: "Protein",
                    data: mealsList[1].protein.toString(),
                  ),
                  CategoryData(
                    category: "Fat",
                    data: mealsList[1].fat.toString(),
                  ),
                ],
              ),
              SizedBox(width: size.width * 0.03),
              Container(
                  height: size.height * 0.25,
                  width: size.width * 0.6,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                      Radius.circular(20.0)
                  ),
                  child: Image.network(mealsList[1].foodImageUrl,fit: BoxFit.contain,
                  ),
                ),
              ),

            ],
          ),


        ],
      ),
    );
  }

  // Transform.rotate(
  //         angle: pi,
  //         child: Container(
  //           height: 200,
  //           width: 160,
  //           child: Image(
  //             image: AssetImage("assets/pictures/breakfast.png"),
  //             fit: BoxFit.cover,
  //           ),
  //         ),
  //       ),

  // ClipRRect(
  // borderRadius: BorderRadius.all(
  // Radius.circular(20.0)
  // ),
  // child: Image.network(mealsList[index].foodImageUrl,fit: BoxFit.fitHeight,
  // ),
  // ),
}