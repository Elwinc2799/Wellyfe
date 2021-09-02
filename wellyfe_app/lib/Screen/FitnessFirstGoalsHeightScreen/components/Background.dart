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
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/pictures/background5.jpg"),
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.075,
            left: size.width * 0.5 - (3 * size.width * 0.025),
            child: Row(
              children: [
                buildContainer(15),
                SizedBox(width: size.width * 0.025),
                buildContainer(45),
                SizedBox(width: size.width * 0.025),
                buildContainer(15),
                SizedBox(width: size.width * 0.025),
                buildContainer(15),
              ],
            ),
          ),
          children,
        ],
      ),
    );
  }

  Container buildContainer(double width) {
    return Container(
      height: 15,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Color(0XFFF4F9FF),
          boxShadow: [
            BoxShadow(
                blurRadius: 5.0,
                offset: Offset(-3, -3),
                color: Colors.grey.withOpacity(0.1)
            ),
            BoxShadow(
                blurRadius: 5.0,
                offset: Offset(3, 3),
                color: Colors.black.withOpacity(.25)
            )
          ]
      ),
    );
  }
}
