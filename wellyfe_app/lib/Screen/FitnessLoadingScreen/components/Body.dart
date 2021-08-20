import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/FitnessManagementOverviewScreen/components/Background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Background(
      children: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 30.0),
        child: Column(
          children: [
            Text(
              "Please wait.\nWe'll be right back!",
              style: TextStyle(
                fontSize: 35,
                fontFamily: "NunitoSans",
                color: Color(0XFF394D70),
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
