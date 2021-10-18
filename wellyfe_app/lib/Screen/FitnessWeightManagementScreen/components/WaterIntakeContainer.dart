import 'package:flutter/material.dart';

class WaterIntakeContainer extends StatelessWidget {
  const WaterIntakeContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.2,
      width: size.width * 0.3,
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
        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage("assets/logo/water.png"), height: size.height * 0.06, width: size.width * 0.06),
            SizedBox(height: size.height * 0.015),
            Text(
              "Water",
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
                      text: "4.2",
                      style: TextStyle(
                        fontSize: 22.5,
                        fontFamily: "NunitoSans",
                        color: Color(0XFF394D70),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: "  litres",
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