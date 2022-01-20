import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellyfe_app/Core/Model/Sleep.dart';

class StatsContainerLower extends StatelessWidget {
  const StatsContainerLower({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Sleep yesterday = Sleep.getPreviousSleepData();

    String getMinuteString(double decimalValue) {
      return '${(decimalValue * 60).toInt()}'.padLeft(2, '0');
    }

    String getHourString(int flooredValue) {
      return '${flooredValue % 24}'.padLeft(2, '0');
    }

    String getTimeStringFromDouble(double value) {
      if (value == 0)
        return '-';

      int flooredValue = value.floor();
      double decimalValue = value - flooredValue;
      String hourValue = getHourString(flooredValue);
      String minuteString = getMinuteString(decimalValue);

      return '${hourValue}h ${minuteString}m';
    }


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StatsContainerIndividualLower(
            isOnTheLeft: true,
            title: "Awake",
            data: "9.30am",
            percentage: 0.5,
          ),
          SizedBox(width: size.width * 0.05),
          StatsContainerIndividualLower(
            isOnTheLeft: false,
            title: "Asleep",
            data: "12.00am",
            percentage: 0.5,
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
      height: size.height * 0.185,
      width: size.width * 0.375,
      decoration: BoxDecoration(
          color: Color(0XFFF4F9FF),
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
                color: Colors.grey.withOpacity(0.1)
            ),
            BoxShadow(
                blurRadius: 5.0,
                offset: Offset(3, 3),
                color: Colors.black.withOpacity(.25)
            )
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 17.5,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w900,
                color: Color(0XFF394D70),
              ),
            ),
            Text(
              "time of yesterday",
              style: TextStyle(
                fontSize: 12.5,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w900,
                color: Color(0XFF394D70),
              ),
            ),
            SizedBox(height: size.height * 0.005),
            Text(
              data,
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w900,
                color: Color(0XFF394D70),
              ),
            ),
            SizedBox(height: size.height * 0.015),
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