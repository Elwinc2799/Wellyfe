import 'package:flutter/material.dart';

class MealPicture extends StatelessWidget {
  const MealPicture({
    Key? key,
    required this.foodImageUrl,
  }) : super(key: key);

  final String foodImageUrl;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        height: size.height * 0.25,
        width: size.width * 0.65,
        child: Image.network(foodImageUrl,fit: BoxFit.fitHeight),
      ),
    );
  }
}