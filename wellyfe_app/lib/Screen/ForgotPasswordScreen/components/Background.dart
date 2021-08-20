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
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/pictures/forgot.png"),
              ),
            ),
          ),
          children,
        ],
      ),
    );
  }
}
