import 'package:flutter/material.dart';

class IngredientsContainerIndividual extends StatelessWidget {
  const IngredientsContainerIndividual({
    Key? key,
    required this.image,
    required this.ingredients,
    required this.grams,
  }) : super(key: key);

  final String image;
  final String ingredients;
  final String grams;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          width: size.width * 0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            image: AssetImage(image),
                            fit: BoxFit.cover,
                          ),
                        )
                    ),
                  ),
                  Text(
                    ingredients,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "NunitoSans",
                      color: Color(0XFF394D70),
                      fontWeight: FontWeight.w800,
                    ),
                  )
                ],
              ),
              Text(
                "$grams gram",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "NunitoSans",
                  color: Color(0XFF394D70),
                  fontWeight: FontWeight.w800,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: size.height * 0.025),
      ],
    );
  }
}