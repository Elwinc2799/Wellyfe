import 'package:flutter/material.dart';

class TitleTimeMood extends StatelessWidget {
  const TitleTimeMood({
    Key? key,
    required this.title,
    required this.time,
    required this.mood,
    required this.weather,
  }) : super(key: key);

  final String title;
  final String time;
  final String mood;
  final String weather;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 40,
              fontFamily: "TitilliumWeb",
              color: Color(0XFF525252),
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            time,
            style: TextStyle(
              fontSize: 25,
              fontFamily: "TitilliumWeb",
              color: Colors.grey.shade400,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Container(
            width: size.width * 0.15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image(image: AssetImage("assets/logo/$mood.png")),
                Image(image: AssetImage("assets/weather/$weather.png"))
              ],
            ),
          )
        ],
      ),
    );
  }
}