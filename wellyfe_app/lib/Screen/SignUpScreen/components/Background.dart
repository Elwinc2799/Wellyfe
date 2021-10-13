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
            top: size.height * 0.1,
            right: -size.height * 0.05,
            child: Container(
              child: Image(
                image: AssetImage("assets/pictures/Plant.png"),
                width: size.width * 0.5,
                height: size.height * 0.3,
              ),
            )
          ),
          children
        ],
      ),
    );
  }
}
