import 'package:flutter/material.dart';

class TimeCalorieContainer extends StatelessWidget {
  const TimeCalorieContainer({
    Key? key,
    required this.time,
    required this.calories,
  }) : super(key: key);

  final int time;
  final int calories;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.1,
      width: size.width * 0.325,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(image: AssetImage("assets/logo/clock.png")),
              Text(
                time.toString() + " min",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: "NunitoSans",
                  color: Color(0XFF394D70),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.015),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(image: AssetImage("assets/logo/flame.png")),
              Text(
                calories.toString() + " kcal",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: "NunitoSans",
                  color: Color(0XFF394D70),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}