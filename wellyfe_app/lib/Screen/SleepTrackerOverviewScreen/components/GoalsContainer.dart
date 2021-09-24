import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class GoalsContainer extends StatefulWidget {
  @override
  _GoalsContainerState createState() => _GoalsContainerState();
}

class _GoalsContainerState extends State<GoalsContainer> {
  ValueNotifier<double> _value = ValueNotifier(2.0);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        width: size.width * 0.8,
        height: size.height * 0.225,
        decoration: BoxDecoration(
            color: Color(0XFFF4F9FF),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sleep Duration Goal\n50 hours",
                      style: TextStyle(
                        fontSize: 27.5,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w900,
                        color: Color(0XFF394D70),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setSleepGoals(context, size);
                      },
                      child: Text(
                        "Set Goals",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.w900,
                          color: Color(0XFF5783C3),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "It is advisable to sleep at least 7 to 9 hours per day.",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w900,
                    color: Color(0XFF394D70),
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }

  Future<dynamic> setSleepGoals(BuildContext context, Size size) {
    return showCupertinoModalBottomSheet(
        context: context,
        builder: (context) => Container(
          height: size.height * 0.3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            child: Column(
              children: [
                Text(
                  "Set Goals",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w900,
                    color: Colors.black45,
                    decoration: TextDecoration.none,
                  ),
                ),
                
              ],
            ),
          ),
        )
    );
  }
}

