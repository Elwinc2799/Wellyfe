import 'package:flutter/material.dart';

class ScheduleMenuIndividual extends StatelessWidget {
  const ScheduleMenuIndividual({
    Key? key,
    required this.title,
    required this.asset,
    required this.total,
  }) : super(key: key);

  final String title;
  final String asset;
  final int total;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.4,
      height: size.height * 0.115,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Color(0XFFEDF1F4),
          boxShadow: [
            BoxShadow(
              blurRadius: 5.0,
              offset: Offset(-3, -3),
              color: Colors.white,
            ),
            BoxShadow(
                blurRadius: 5.0,
                offset: Offset(3, 3),
                color: Colors.black.withOpacity(.25)
            ),
          ]
      ),
      child: Stack(
        children: [
          Positioned(
              top: size.height * (0.125 / 3.75),
              left: size.width * (0.4 / 12.5),
              child: Image(image: AssetImage(asset))
          ),
          Positioned(
            top: size.height * (0.125 / 4.5),
            left: size.width * (0.4 / 7) * 2.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: "NunitoSans",
                    fontWeight: FontWeight.w700,
                    color: Color(0XFF344460),
                  ),
                ),
                Text(
                  total.toString(),
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: "NunitoSans",
                    fontWeight: FontWeight.w700,
                    color: Color(0XFF344460).withOpacity(0.5),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}