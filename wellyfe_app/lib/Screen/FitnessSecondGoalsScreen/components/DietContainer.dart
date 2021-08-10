import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/FitnessThirdGoalsScreen/FitnessThirdGoalsScreen.dart';

class DietContainer extends StatelessWidget {
  const DietContainer({
    Key? key,
    required this.diet,
    required this.description,
  }) : super(key: key);

  final String diet;
  final String description;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return FitnessThirdGoalsScreen();
            }
        ));
      },
      child: Container(
        height: size.height * 0.19,
        width: size.width * 0.75,
        decoration: BoxDecoration(
            color: Color(0XFFF4F9FF),
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
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
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                diet,
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: "NunitoSans",
                  color: Color(0XFF394D70),
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: size.height * 0.025),
              SizedBox(
                width: size.width * 0.5,
                child: Text(
                  description,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "NunitoSans",
                    color: Color(0XFF394D70),
                    fontWeight: FontWeight.w700,
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