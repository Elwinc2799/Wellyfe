import 'package:flutter/material.dart';

class IngredientsContainer extends StatelessWidget {
  const IngredientsContainer({
    Key? key,
    required this.ingredients,
  }) : super(key: key);

  final List<String> ingredients;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.2,
      width: size.width * 0.3,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ingredients",
              style: TextStyle(
                fontSize: 25,
                fontFamily: "NunitoSans",
                color: Color(0XFF394D70),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: size.height * 0.025),
            for (var i = 0; i < ingredients.length; i++)
              Column(
                children: [
                  Text(
                    ingredients[i],
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: "NunitoSans",
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: size.height * 0.005),
                ],
              )
          ],
        ),
      ),
    );
  }
}