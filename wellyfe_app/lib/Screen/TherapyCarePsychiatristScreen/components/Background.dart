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
          Container(
            height: size.height,
            width: size.width,
            child: Image(
              image: AssetImage("assets/pictures/background7.png"),
              fit: BoxFit.cover,
            ),
          ),
          children,
        ],
      ),
    );
  }
}
