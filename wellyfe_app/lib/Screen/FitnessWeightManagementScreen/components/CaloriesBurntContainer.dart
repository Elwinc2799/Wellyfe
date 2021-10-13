import 'package:flutter/material.dart';

class CaloriesBurntContainer extends StatelessWidget {
  const CaloriesBurntContainer({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.2,
      width: size.width * 0.45,
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image(image: AssetImage("assets/logo/flame.png"), height: size.height * 0.06, width: size.width * 0.06),
                SizedBox(width: size.width * 0.05),
                Text(
                  "Today",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "NunitoSans",
                    color: Colors.black.withOpacity(0.3),
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            SizedBox(height: size.height * 0.015),
            Text(
              "Calories Burnt",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "NunitoSans",
                color: Colors.black.withOpacity(0.3),
                fontWeight: FontWeight.w700,
              ),
            ),
            RichText(
              text: TextSpan(
                  children: [
                    TextSpan(
                      text: "1492",
                      style: TextStyle(
                        fontSize: 22.5,
                        fontFamily: "NunitoSans",
                        color: Color(0XFF394D70),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: "  kcal",
                      style: TextStyle(
                        fontSize: 17.5,
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
    );
  }
}