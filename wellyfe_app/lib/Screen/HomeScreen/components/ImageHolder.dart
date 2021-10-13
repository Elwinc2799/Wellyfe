import 'package:flutter/material.dart';
import 'dart:math';

class ImageHolder extends StatelessWidget {

  final String image;

  const ImageHolder({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Transform.rotate(
      angle: 45 * pi / 180,
      child: Center(
        child: Image(image: AssetImage(image), height: 90, width: 80),
      ),
    );
  }
}
