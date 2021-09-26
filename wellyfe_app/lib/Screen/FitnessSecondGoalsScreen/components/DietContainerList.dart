import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/FitnessSecondGoalsScreen/components/DietContainer.dart';

class DietContainerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<DietPlan> dietPlanList = [
      DietPlan("Ketogenic", "The ketogenic diet is a low carb, high fat diet that offers many health benefits."),
      DietPlan("Vegetarian", "Vegetarianism is the practice of abstaining from the consumption of meat, and the abstention from by-products of animal slaughter."),
      DietPlan("Mediterranean", "The Mediterranean diet is based on the traditional foods from 1960s of Italy and Greece.")
    ];

    Size size = MediaQuery.of(context).size;

    return CarouselSlider(
      options: CarouselOptions(
        height: size.height * 0.54,
        viewportFraction: 0.7,
      ),
      items: [0, 1, 2].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return DietContainer(
              diet: dietPlanList[i],
            );
          },
        );
      }).toList(),
    );
  }
}

class DietPlan {
  final String diet;
  final String description;

  DietPlan(this.diet, this.description);
}