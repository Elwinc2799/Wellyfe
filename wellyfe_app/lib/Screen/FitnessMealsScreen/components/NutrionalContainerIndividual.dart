import 'package:flutter/material.dart';

class NutritionalContainerIndividual extends StatelessWidget {
  const NutritionalContainerIndividual({
    Key? key,
    required this.category,
    required this.nutritional,
  }) : super(key: key);

  final String category;
  final String nutritional;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.135,
      width: size.width * 0.2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.elliptical(80.0, 30.0)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0.5),
              color: Colors.black.withOpacity(0.3),
              blurRadius: 2
            )
          ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            category,
            style: TextStyle(
                fontSize: 15,
                fontFamily: "NunitoSans",
                color: Colors.black.withOpacity(0.5),
                fontWeight: FontWeight.w800
            ),
          ),
          Text(
            nutritional,
            style: TextStyle(
                fontSize: 17.5,
                fontFamily: "NunitoSans",
                color: Color(0XFF394D70),
                fontWeight: FontWeight.w800
            ),
          ),
        ],
      ),
    );
  }
}