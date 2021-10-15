import 'package:flutter/material.dart';

class ScheduleMenuIndividual extends StatelessWidget {
  const ScheduleMenuIndividual({
    Key? key,
    required this.title,
    required this.asset,
    required this.total,
    required this.color,
  }) : super(key: key);

  final String title;
  final String asset;
  final int total;
  final Color color;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.4,
      height: size.height * 0.1,
      decoration: BoxDecoration(
        color: Color(0XFFE5EBF2),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            offset: Offset(-3, -3),
            color: Colors.white
          ),
          BoxShadow(
            blurRadius: 5.0,
            offset: Offset(3, 3),
            color: Colors.black.withOpacity(.25)
          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(asset, height: 32.5, width: 32.5,),
            SizedBox(width: size.width * 0.035,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  total.toString(),
                  style: TextStyle(
                    fontSize: 23,
                    fontFamily: "NunitoSans",
                    fontWeight: FontWeight.w700,
                    color: Color(0XFF394D70),
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: "NunitoSans",
                    fontWeight: FontWeight.w700,
                    color: Color(0XFF394D70),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}