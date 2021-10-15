import 'package:flutter/material.dart';

class TopLevelIcon extends StatelessWidget {
  const TopLevelIcon({
    Key? key,
    required this.asset,
    required this.function,
  }) : super(key: key);

  final String asset;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: function,
      child: Container(
        height: size.height * 0.05,
        width: size.height * 0.05,
        child: Image(image: AssetImage(asset), width: 5, height: 5),
        decoration: BoxDecoration(
          color: Color(0XFFE5EBF2),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              blurRadius: 5.0,
              offset: Offset(-3, -3),
              color: Colors.white
            ),
            BoxShadow(
              blurRadius: 5.0,
              offset: Offset(3, 3),
              color: Colors.black.withOpacity(.25)
            )
          ]
        ),
      ),
    );
  }
}