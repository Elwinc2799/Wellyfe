import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/TherapyCarePsychiatristScreen/components/QualificationContainer.dart';

class QualificationsRow extends StatelessWidget {
  const QualificationsRow({
    Key? key,
    required this.patients,
    required this.yearsExp,
    required this.ratings,
  }) : super(key: key);

  final int patients;
  final int yearsExp;
  final double ratings;

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
            data: patients.toString(),
            qualification: "Patients",
          ),
          QualificationContainer(
            data: yearsExp.toString(),
            qualification: "Years Exp",
          ),
          QualificationContainer(
            data: ratings.toString(),
            qualification: "Ratings",
          ),
        ],
      ),
    );
  }
}