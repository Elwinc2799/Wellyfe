import 'package:flutter/material.dart';

class PictureContainer extends StatelessWidget {
  const PictureContainer({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.5,
      width: size.width,
      child: Image(
        image: AssetImage(image),
        fit: BoxFit.cover,
      ),
    );
  }
}