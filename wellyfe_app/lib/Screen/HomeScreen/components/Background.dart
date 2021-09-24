import 'package:flutter/cupertino.dart';
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
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              // image: DecorationImage(
              //   fit: BoxFit.cover,
              //   image: AssetImage("assets/pictures/background7.png"),
              // ),
              color: Color(0XFFF2F3F7)
            ),
          ),
          // Positioned(
          //   bottom: size.height * 0.3,
          //   right: size.width * 0.425,
          //   child: Transform.rotate(
          //     angle: 45 * pi / 180,
          //     child: PlaceholderContainer(width: 500),
          //   ),
          // ),
          children,
        ],
      ),
    );
  }
}
