import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wellyfe_app/Screen/FitnessFirstGoalsScreen/FitnessFirstGoalsScreen.dart';

class GoalsButton extends StatefulWidget {
  @override
  _GoalsButtonState createState() => _GoalsButtonState();
}

class _GoalsButtonState extends State<GoalsButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(context, PageTransition(
            type: PageTransitionType.fade,
            child: FitnessFirstGoalsScreen(),
          ),
        );
      },
      child: Center(
        child: Container(
          width: size.width * 0.5,
          height: size.height * 0.05,
          decoration: BoxDecoration(
              color: Color(0XFFF4F9FF),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
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
          child: Center(
            child: Text(
              "Set Your Goals",
              style: TextStyle(
                fontSize: 17.5,
                fontFamily: "NunitoSans",
                color: Colors.black.withOpacity(0.3),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
