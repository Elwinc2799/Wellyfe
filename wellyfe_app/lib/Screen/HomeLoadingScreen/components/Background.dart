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
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xffe3e6ef),
                  Color(0xffeeeff8),
                ],
              ),
              image: DecorationImage(
                image: AssetImage("assets/pictures/loader.gif"),
              ),
            ),
          ),
          children,
        ],
      ),
    );
  }
}
