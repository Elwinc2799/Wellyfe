import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SocialMediaIcon extends StatelessWidget {
  const SocialMediaIcon({
    Key? key,
    required this.function,
    required this.asset,
  }) : super(key: key);

  final VoidCallback function;
  final String asset;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: function,
      child: Container(
        height: size.height * 0.1,
        width: size.width * 0.1,
        child: Neumorphic(
          child: Image(image: AssetImage(asset)),
          style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.circle(),
            shape: NeumorphicShape.convex,
            lightSource: LightSource.topLeft,
            depth: 20,
          ),
        ),
      ),
    );
  }
}