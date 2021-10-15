import 'package:flutter/material.dart';

class DataTitle extends StatelessWidget {
  const DataTitle({
    Key? key,
    required this.data,
    required this.title,
  }) : super(key: key);

  final String data;
  final String title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          data,
          style: TextStyle(
            fontSize: 23,
            fontFamily: "Montserrat",
            color: Colors.black54,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: size.height * 0.005),
        Text(
          title,
          style: TextStyle(
            fontSize: 13,
            fontFamily: "Montserrat",
            color: Colors.black45,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}