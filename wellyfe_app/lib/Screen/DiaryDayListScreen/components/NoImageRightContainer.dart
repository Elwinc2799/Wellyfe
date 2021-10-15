import 'package:flutter/material.dart';
import 'dart:math' as math;

class NoImageRightContainer extends StatelessWidget {
  const NoImageRightContainer({
    Key? key,
    required this.content,
  }) : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          height: size.height * 0.20,
          width: size.width * 0.575,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Image(image: AssetImage("assets/logo/quote.png"), width: 22.5, height: 22.5,),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Transform.rotate(
                    angle: 180 * math.pi / 180,
                    child: Image(image: AssetImage("assets/logo/quote.png"), width: 22.5, height: 22.5,),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: size.height * 0.06,
                      width: size.width * 0.25,
                      child: Center(
                        child: Text(
                          content,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Montserrat",
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
