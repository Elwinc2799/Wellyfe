import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({
    Key? key,
    required this.children,
  }) : super(key: key);

  final Widget children;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Positioned(
          //   top: size.height * 0.01,
          //   right: -size.width * 0.2,
          //   child: Stack(
          //     children: [
          //       NeumorphicIcon(
          //         Icons.wb_cloudy_sharp,
          //         size: size.width * 0.6,
          //         style: NeumorphicStyle(
          //           surfaceIntensity: 0.5,
          //           shape: NeumorphicShape.convex,
          //           depth: 20,
          //           border: NeumorphicBorder(
          //             color: Colors.grey[300],
          //             width: 0.8,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          children,
        ],
      ),
    );
  }
}
