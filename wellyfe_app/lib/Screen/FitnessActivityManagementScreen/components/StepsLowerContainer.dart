import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StepsLowerContainer extends StatelessWidget {
  const StepsLowerContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        height: size.height * 0.13,
        width: size.width * 0.875,
        decoration: BoxDecoration(
            color: Color(0XFFF4F9FF),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
          padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Steps",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "NunitoSans",
                          color: Colors.black.withOpacity(0.3),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: size.width * 0.025),
                      Image(image: AssetImage("assets/logo/steps.png"), height: size.height * 0.07, width: size.width * 0.07),
                    ],
                  ),
                  SizedBox(width: size.width * 0.25),
                  Text(
                    DateFormat('E, d MMM').format(DateTime.now()),
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "NunitoSans",
                      color: Color(0XFF394D70),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "4219",
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: "NunitoSans",
                          color: Color(0XFF394D70),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: "  steps",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "NunitoSans",
                          color: Colors.black.withOpacity(0.3),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}