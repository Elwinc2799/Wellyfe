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
        children: [
          Positioned(
            top: -200,
            left: -100,
            child: Container(
              width: size.width * 0.5,
              height: size.height * 0.5,
              decoration: BoxDecoration(
                color: Color(0xFFECF3FE),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: size.width,
              height: size.height * 0.425,
              decoration: BoxDecoration(
                color: Color(0xFFECF3FE),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(3000, 1500),
                )
              ),
            ),
          ),
          children,
        ],
      ),
    );
  }
}
