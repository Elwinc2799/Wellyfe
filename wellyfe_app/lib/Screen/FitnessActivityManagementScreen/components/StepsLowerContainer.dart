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
          padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Steps",
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: "NunitoSans",
                          color: Colors.black.withOpacity(0.3),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: size.width * 0.025),
                      Image(image: AssetImage("assets/logo/steps.png")),
                    ],
                  ),
                  Text(
                    DateFormat('EEEE, d MMMM').format(DateTime.now()),
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: "NunitoSans",
                      color: Color(0XFF394D70),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.01),
              RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "4219",
                        style: TextStyle(
                          fontSize: 40,
                          fontFamily: "NunitoSans",
                          color: Color(0XFF394D70),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: "  steps",
                        style: TextStyle(
                          fontSize: 25,
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