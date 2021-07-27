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

    return Neumorphic(
      style: NeumorphicStyle(
        shape: NeumorphicShape.concave,
        lightSource: LightSource.bottom,
        depth: -5,
        color: color,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20.0)),
      ),
      child: Container(
        width: size.width * 0.4,
        height: size.height * 0.115,
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
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "NunitoSans",
                      fontWeight: FontWeight.w700,
                      color: Colors.white.withOpacity(0.75),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}