import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/ScheduleNewTask/components/AddNewForm.dart';
import 'package:wellyfe_app/Screen/ScheduleOverviewScreen/components/Background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      children: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 100.0, 10.0, 0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your schedule matter to us.",
                style: TextStyle(
                  fontSize: 21,
                  fontFamily: "NunitoSans",
                  fontWeight: FontWeight.w400,
                  color: Color(0XFF394D70)
                ),
              ),
              SizedBox(height: size.height * 0.005),
              Text(
                "Add New Task",
                style: TextStyle(
                  fontSize: 31,
                  fontFamily: "NunitoSans",
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF394D70),
                ),
              ),
              SizedBox(height: size.height * 0.05),
              AddNewForm(),
            ],
          ),
        ),
      ),
    );
  }
}
