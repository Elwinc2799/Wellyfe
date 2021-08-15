import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/TherapyCarePsychiatristScreen/components/QualificationContainer.dart';

class QualificationsRow extends StatelessWidget {
  const QualificationsRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.1,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          QualificationContainer(
            data: "648",
            qualification: "Patients",
          ),
          QualificationContainer(
            data: "9",
            qualification: "Years Exp",
          ),
          QualificationContainer(
            data: "4.9",
            qualification: "Ratings",
          ),
        ],
      ),
    );
  }
}