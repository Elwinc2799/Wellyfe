import 'package:flutter/material.dart';
import 'package:wellyfe_app/Core/Model/Doctor.dart';

class SpecialistRecommendationContainerIndividual extends StatelessWidget {
  const SpecialistRecommendationContainerIndividual({
    Key? key,
    required this.doctor,
    required this.function,
  }) : super(key: key);

  final Doctor doctor;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool newRow = (doctor.specialisedTherapy == "Child");

    return Padding(
      padding: const EdgeInsets.only(right: 50.0, top: 17.5),
      child: GestureDetector(
        onTap: function,
        child: Container(
          height: size.height * 0.175,
          width: size.width * 0.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFFFFFFF).withOpacity(0.3),
                  Color(0xFFFFFFFF).withOpacity(0.2),
                ],
                stops: [
                  0.1,
                  1,
                ]
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                right: -200,
                top: 10,
                child: Container(
                    width: size.width * 0.75,
                    child: Image(image: AssetImage("assets/pictures/doctor1.png"))
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0, 20.0),
                child: Container(
                  height: size.height * 0.2,
                  width: newRow ? size.width * 0.175 : size.width * 0.225,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Dr. " + doctor.name,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 22.5,
                          fontFamily: "NunitoSans",
                          color: Color(0XFF394D70),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        doctor.specialisedTherapy + " Therapy",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "NunitoSans",
                          color: Color(0XFF394D70),
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}