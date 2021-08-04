import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatsContainerLower extends StatelessWidget {
  const StatsContainerLower({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StatsContainerIndividualLower(
            isOnTheLeft: true,
            title: "Awake",
            data: "16h 20m",
            percentage: (24 - 7.67) / 24,
          ),
          SizedBox(width: size.width * 0.05),
          StatsContainerIndividualLower(
            isOnTheLeft: false,
            title: "Asleep",
            data: "7h 40m",
            percentage: 7.67 / 24,
          ),
        ],
      ),
    );
  }
}

class StatsContainerIndividualLower extends StatelessWidget {
  const StatsContainerIndividualLower({
    Key? key,
    required this.isOnTheLeft,
    required this.title,
    required this.data,
    required this.percentage,
  }) : super(key: key);

  final bool isOnTheLeft;
  final String title;
  final String data;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.2,
      width: size.width * 0.375,
      decoration: BoxDecoration(
          color: Color(0XFFE1E2EB),
          borderRadius: BorderRadius.only(
            topLeft: isOnTheLeft ? Radius.circular(50.0) : Radius.circular(5.0),
            topRight: isOnTheLeft ? Radius.circular(5.0) : Radius.circular(50.0),
            bottomRight: isOnTheLeft ? Radius.circular(50.0) : Radius.circular(5.0),
            bottomLeft: isOnTheLeft ? Radius.circular(5.0) : Radius.circular(50.0),
          ),
          boxShadow: [
            BoxShadow(
                blurRadius: 5.0,
                offset: Offset(-3, -3),
                color: Colors.white.withOpacity(0.75)
            ),
            BoxShadow(
                blurRadius: 5.0,
                offset: Offset(3, 3),
                color: Colors.black.withOpacity(.25)
            )
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 22.5,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w900,
                color: Color(0XFF394D70),
              ),
            ),
            Text(
              "time per day",
              style: TextStyle(
                fontSize: 17.5,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w900,
                color: Color(0XFF394D70),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Text(
              data,
              style: TextStyle(
                fontSize: 40,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w900,
                color: Color(0XFF394D70),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Stack(
              children: [
                Container(
                  height: size.height * 0.01,
                  width: size.width * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.25),
                    borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  ),
                ),
                Container(
                  height: size.height * 0.01,
                  width: 165 * percentage,
                  decoration: BoxDecoration(
                      color: Color(0XFFF1A288),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}