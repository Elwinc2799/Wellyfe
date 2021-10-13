import 'package:flutter/material.dart';

class MealPicture extends StatelessWidget {
  const MealPicture({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        height: size.height * 0.25,
        width: size.width * 0.65,
        child: Image(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}