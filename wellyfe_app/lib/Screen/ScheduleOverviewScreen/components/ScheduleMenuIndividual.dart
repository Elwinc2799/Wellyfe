import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

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

    // return Neumorphic(
    //   style: NeumorphicStyle(
    //     shape: NeumorphicShape.convex,
    //     color: Color(0XFFE4EDFF),
    //     boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20.0)),
    //   ),
    //   child: Container(
    //     width: size.width * 0.4,
    //     height: size.height * 0.115,
    //     child: Stack(
    //       children: [
    //         Positioned(
    //             top: size.height * (0.125 / 3.75),
    //             left: size.width * (0.4 / 12.5),
    //             child: Image(image: AssetImage(asset))
    //         ),
    //         Positioned(
    //           top: size.height * (0.125 / 4.5),
    //           left: size.width * (0.4 / 7) * 2.5,
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 total.toString(),
    //                 style: TextStyle(
    //                   fontSize: 30,
    //                   fontFamily: "NunitoSans",
    //                   fontWeight: FontWeight.w700,
    //                   color: Color(0XFFB1BDD3),
    //                 ),
    //               ),
    //               Text(
    //                 title,
    //                 style: TextStyle(
    //                   fontSize: 20,
    //                   fontFamily: "NunitoSans",
    //                   fontWeight: FontWeight.w700,
    //                   color: Color(0XFFB1BDD3),
    //                 ),
    //               )
    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );

    return Container(
      width: size.width * 0.4,
      height: size.height * 0.115,
      decoration: BoxDecoration(
        color: Color(0XFFE4EDFF),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
                  total.toString(),
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: "NunitoSans",
                    fontWeight: FontWeight.w700,
                    color: Color(0XFFB1BDD3),
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "NunitoSans",
                    fontWeight: FontWeight.w700,
                    color: Color(0XFFB1BDD3),
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