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
              size: 75,
              radius: 20,
            ),
            FoodContainerIndividual(
              food: "Peanut",
              size: 150,
              radius: 30,
            ),
            FoodContainerIndividual(
              food: "Bean",
              size: 130,
              radius: 30,
            ),
          ],
        ),
        SizedBox(height: size.height * 0.025),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FoodContainerIndividual(
              food: "Seafood",
              size: 150,
              radius: 30,
            ),
            FoodContainerIndividual(
              food: "Lactose",
              size: 130,
              radius: 30,
            ),
            FoodContainerIndividual(
              food: "Pork",
              size: 100,
              radius: 30,
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
              size: 130,
              radius: 30,
            ),
            FoodContainerIndividual(
              food: "",
              size: 75,
              radius: 20,
            ),
            FoodContainerIndividual(
              food: "Soybeans",
              size: 150,
              radius: 30,
            ),
          ],
        )
      ],
    );
  }
}