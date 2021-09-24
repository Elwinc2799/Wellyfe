import 'package:flutter/material.dart';

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
        child: Container(
          child: Image(image: AssetImage(asset)),
        ),
      ),
    );
  }
}