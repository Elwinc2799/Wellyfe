import 'package:flutter/cupertino.dart';
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
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Container(
                width: size.width * 0.45,
                height: size.height * 0.1,
                decoration: BoxDecoration(
                  color: Color(0XFFE3F2FF),
                  borderRadius: BorderRadius.circular(20.0)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: [
                                TextSpan(
                                  text: "Current",
                                  style: TextStyle(
                                    fontSize: 17.5,
                                    fontFamily: "NunitoSans",
                                    color: Color(0XFF394D70),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: "\nBMI",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: "NunitoSans",
                                    color: Color(0XFF394D70),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "17.5",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: "NunitoSans",
                                  color: Color(0XFF394D70),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                getBMICategory(17.5),
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: "NunitoSans",
                                  color: Color(0XFF394D70),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: [
                          TextSpan(
                            text: "Target",
                            style: TextStyle(
                              fontSize: 17.5,
                              fontFamily: "NunitoSans",
                              color: Color(0XFF394D70),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: "\nBMI",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "NunitoSans",
                              color: Color(0XFF394D70),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "21",
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: "NunitoSans",
                              color: Color(0XFF394D70),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            getBMICategory(21),
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: "NunitoSans",
                              color: Color(0XFF394D70),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}