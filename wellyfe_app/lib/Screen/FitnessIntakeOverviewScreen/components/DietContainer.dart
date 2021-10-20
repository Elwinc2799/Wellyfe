import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/FitnessIntakeOverviewScreen/components/CategoryData.dart';

class DietContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.04),
          Row(
            children: [
              Image(
                image: AssetImage("assets/logo/flame.png"),
                height: size.height * 0.06,
                width: size.width * 0.06
              ),
              Text(
                "1500" + " kcal",
                style: TextStyle(
                  fontSize: 22.5,
                  fontFamily: "NunitoSans",
                  color: Colors.black.withOpacity(0.3),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          CategoryData(
            category: "Carb",
            data: "100",
          ),
          CategoryData(
            category: "Protein",
            data: "100",
          ),
          CategoryData(
            category: "Fat",
            data: "100",
          )
        ],
      ),
    );
  }

  // Transform.rotate(
        //   angle: pi,
        //   child: Container(
        //     height: 200,
        //     width: 160,
        //     child: Image(
        //       image: AssetImage("assets/pictures/breakfast.png"),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
}