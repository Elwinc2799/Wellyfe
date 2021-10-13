import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/FitnessThirdGoalsScreen/components/FoodContainerIndividual.dart';

class FoodContainerColumn extends StatelessWidget {
  const FoodContainerColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FoodContainerIndividual(
              food: "",
              size: 50,
              radius: 15,
            ),
            FoodContainerIndividual(
              food: "Peanut",
              size: 120,
              radius: 25,
            ),
            FoodContainerIndividual(
              food: "Bean",
              size: 105,
              radius: 25,
            ),
          ],
        ),
        SizedBox(height: size.height * 0.025),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FoodContainerIndividual(
              food: "Seafood",
              size: 120,
              radius: 25,
            ),
            FoodContainerIndividual(
              food: "Lactose",
              size: 105,
              radius: 25,
            ),
            FoodContainerIndividual(
              food: "Pork",
              size: 75,
              radius: 20,
            ),
          ],
        ),
        SizedBox(height: size.height * 0.025),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FoodContainerIndividual(
              food: "Beef",
              size: 105,
              radius: 25,
            ),
            FoodContainerIndividual(
              food: "",
              size: 50,
              radius: 15,
            ),
            FoodContainerIndividual(
              food: "Soybeans",
              size: 120,
              radius: 25,
            ),
          ],
        )
      ],
    );
  }
}