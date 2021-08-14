import 'package:flutter/material.dart';

class IconTime extends StatelessWidget {
  const IconTime({
    Key? key,
    required this.icon,
    required this.time,
    required this.width,
  }) : super(key: key);

  final String time;
  final IconData icon;
  final double width;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            color: Colors.grey.shade600,
          ),
          Text(
            time,
            style: TextStyle(
              fontSize: 20,
              fontFamily: "NunitoSans",
              color: Color(0XFF394D70),
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}