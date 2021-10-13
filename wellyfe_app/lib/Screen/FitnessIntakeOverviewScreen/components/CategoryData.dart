import 'package:flutter/material.dart';

class CategoryData extends StatelessWidget {
  const CategoryData({
    Key? key,
    required this.category,
    required this.data,
  }) : super(key: key);

  final String category;
  final String data;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height * 0.01),
        Text(
          category,
          style: TextStyle(
            fontSize: 17.5,
            fontFamily: "NunitoSans",
            color: Colors.black.withOpacity(0.3),
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          data + " g",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "NunitoSans",
            color: Colors.black.withOpacity(0.3),
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}