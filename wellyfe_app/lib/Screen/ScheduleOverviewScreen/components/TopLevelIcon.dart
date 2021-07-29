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
        height: size.height * 0.055,
        width: size.width * 0.1,
        child: Image(image: AssetImage(asset),width: 100, height: 100,),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffd6dff0)),
          color: Color(0xffe4effe),
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