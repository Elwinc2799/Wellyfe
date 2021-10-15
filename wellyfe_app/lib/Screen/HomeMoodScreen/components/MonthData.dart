import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wellyfe_app/Core/Model/Mood.dart';

class MonthData extends StatelessWidget {
  const MonthData({
    Key? key,
    required this.month,
    required this.moodList,
  }) : super(key: key);

  final String month;
  final List<Mood> moodList;

  String formatString(String string) {
    return string.substring(0, 1).toUpperCase() + string.substring(1, string.length);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size.width * 0.25,
            child: Text(
              month,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 17.5,
                fontFamily: "Montserrat",
                color: Color(0XFF394D70),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(width: size.width * 0.075),
          Column(
            children: [
              for (var i = 0; i < moodList.length; i += 10)
                Column(
                  children: [
                    SizedBox(height: size.height * 0.01),
                    Container(
                      width: size.width * 0.525,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          for (var j = i; j < i + 10 && j < moodList.length; j++)
                            Row(
                              children: [
                                Tooltip(
                                  message: "Mood: " + formatString(moodList[j].mood)
                                      + "\nDate: " + DateFormat('EEEE, d MMM').format(moodList[j].date),
                                  height: 40,
                                  textStyle: TextStyle(
                                    fontSize: 12.5,
                                    color: Colors.white
                                  ),
                                  child: Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Mood.getMoodColor(moodList[j].mood),
                                    ),
                                  ),
                                ),
                                SizedBox(width: size.width * 0.015),
                              ],
                            )
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                  ],
                )
            ],
          ),
        ],
      ),
    );
  }
}