import 'package:flutter/material.dart';

class UpcomingEventsContainerIndividual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.3,
            width: size.width,
            child: Image(
              image: AssetImage("assets/pictures/poster.png"),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
            child: Container(
              width: size.width * 0.45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Mental Health Day Talk",
                     style: TextStyle(
                      fontSize: 25,
                      fontFamily: "NunitoSans",
                      color: Color(0XFF394D70),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Come and join us on FB Live!",
                     style: TextStyle(
                      fontSize: 17.5,
                      fontFamily: "NunitoSans",
                      color: Color(0XFF394D70),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "FB: Wellyfe Mental Health",
                     style: TextStyle(
                      fontSize: 17.5,
                      fontFamily: "NunitoSans",
                      color: Color(0XFF394D70),
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}