import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class Background extends StatelessWidget {
  const Background({
    Key? key,
    required this.children,
  }) : super(key: key);

  final Widget children;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GlassmorphicContainer(
      height: size.height,
      width: size.width,
      borderRadius: 25,
      border: 2.5,
      blur: 20,
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0XFFBAF9FF).withOpacity(0.35),
            Color(0XFFE1E2F8).withOpacity(0.5),
          ],
          stops: [
            0.1,
            1,
          ]
      ),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFFFFFFF).withOpacity(0.25),
          Color((0xFFFFFFFF)).withOpacity(0.75),
        ],
      ),
      child: Stack(
        children: [

          children,
        ],
      ),
    );
  }
}
