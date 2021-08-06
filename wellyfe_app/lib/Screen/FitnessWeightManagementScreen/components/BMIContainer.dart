import 'package:flutter/material.dart';

class BMIContainer extends StatelessWidget {
  const BMIContainer({
    Key? key,
  }) : super(key: key);

  String getBMICategory(double BMI) {
    if (BMI >= 30)
      return "Obese";
    else if (BMI >= 25 && BMI < 30)
      return "Overweight";
    else if (BMI >= 18.5 && BMI < 24.5)
      return "Normal";
    else
      return "Underweight";
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        height: size.height * 0.125,
        width: size.width * 0.8,
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
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(image: AssetImage("assets/logo/health.png")),
                  Text(
                    "Body Mass Index, BMI",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: "NunitoSans",
                      color: Colors.black.withOpacity(0.3),
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
              SizedBox(height: size.height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "21.1",
                    style: TextStyle(
                      fontSize: 32.5,
                      fontFamily: "NunitoSans",
                      color: Color(0XFF394D70),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    getBMICategory(21.1),
                    style: TextStyle(
                      fontSize: 32.5,
                      fontFamily: "NunitoSans",
                      color: Colors.black.withOpacity(0.3),
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}