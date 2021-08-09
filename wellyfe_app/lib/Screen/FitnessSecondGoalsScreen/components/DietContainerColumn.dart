import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/FitnessSecondGoalsScreen/components/DietContainer.dart';

class DietContainerColumn extends StatelessWidget {
  const DietContainerColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.425,
      width: size.width,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DietContainer(
                diet: "Ketogenic Diet",
                description: "The ketogenic diet is a low carb, high fat diet that offers many health benefits.",
              ),
              SizedBox(height: size.height * 0.025),
              DietContainer(
                diet: "Vegetarian Diet",
                description: "A vegetarian diet focuses on plants for food like fruits and vegetables.",
              ),
              SizedBox(height: size.height * 0.025),
              DietContainer(
                diet: "Mediterranean Diet",
                description: "A Southern European diet that focuses on the nutritional habits of Greece and southern Italy.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}