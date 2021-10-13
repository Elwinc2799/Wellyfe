import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wellyfe_app/Screen/SleepTrackerAnalysisScreen/SleepTrackerAnalysisScreen.dart';

class MidLevelBar extends StatelessWidget {
  const MidLevelBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Statistics",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Nunito",
            fontWeight: FontWeight.w700,
            color: Color(0XFF394D70),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, PageTransition(
              type: PageTransitionType.fade,
              child: SleepTrackerAnalysisScreen(),
            ));
          },
          child: Text(
            "More",
            style: TextStyle(
              fontSize: 20,
              fontFamily: "NunitoSans",
              fontWeight: FontWeight.w800,
              color: Color(0XFF394D70),
            ),
          ),
        ),
      ],
    );
  }
}