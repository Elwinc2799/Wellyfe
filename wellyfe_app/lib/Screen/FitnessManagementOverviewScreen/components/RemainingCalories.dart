import 'package:flutter/material.dart';

class RemainingCalories extends StatelessWidget {
  const RemainingCalories({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        height: size.height * 0.1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Remaining",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "NunitoSans",
                color: Colors.black.withOpacity(0.3),
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "1,279 kcal",
              style: TextStyle(
                fontSize: 27.5,
                fontFamily: "NunitoSans",
                color: Color(0XFF394D70),
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}