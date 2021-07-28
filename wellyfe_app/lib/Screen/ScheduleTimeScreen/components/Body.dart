import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/ScheduleTimeScreen/components/DaysList.dart';
import 'package:wellyfe_app/Screen/ScheduleTimeScreen/components/MidLevelDivider.dart';
import 'package:wellyfe_app/Screen/ScheduleTimeScreen/components/Timeline.dart';
import 'package:wellyfe_app/Screen/ScheduleTimeScreen/components/TopLevelBar.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopLevelBar(),
          SizedBox(height: size.height * 0.05),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    "Task",
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: "NunitoSans",
                      fontWeight: FontWeight.w800,
                      color: Color(0XFF344460),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                DaysList(),
                SizedBox(height: size.height * 0.03),
                MidLevelDivider(),
                SizedBox(height: size.height * 0.03),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    child: Container(
                      height: size.height * 0.125,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Timeline(
                            startTime: "10 AM",
                            endTime: "11 AM",
                          ),
                          SizedBox(width: size.width * 0.1),
                          Container(
                            height: size.height * 0.125,
                            width: size.width * 0.65,
                            decoration: BoxDecoration(
                              color: Color(0XFFEDF1F4),
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5.0,
                                  offset: Offset(-3, -3),
                                  color: Colors.white
                                ),
                                BoxShadow(
                                  blurRadius: 5.0,
                                  offset: Offset(3, 3),
                                  color: Colors.black.withOpacity(.25)
                                )
                              ]
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: size.height * 0.125,
                                  width: size.width * 0.05,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      bottomLeft: Radius.circular(20.0),
                                    ),
                                    color: Color(0XFF1CB3B2),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
