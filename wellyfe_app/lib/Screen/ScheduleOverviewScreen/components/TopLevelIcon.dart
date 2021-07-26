import 'package:flutter/material.dart';

class TopLevelIcon extends StatelessWidget {
  const TopLevelIcon({
    Key? key,
    required this.asset,
    required this.function,
    required this.angle,
  }) : super(key: key);

  final String asset;
  final double angle;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: function,
      child: Container(
        height: size.height * 0.055,
        width: size.width * 0.1,
        child: Transform.rotate(
          angle: angle,
          child: Image(image: AssetImage(asset))
        ),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
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