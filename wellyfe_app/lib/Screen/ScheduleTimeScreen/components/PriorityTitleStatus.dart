import 'package:flutter/material.dart';

class PriorityTitleStatus extends StatelessWidget {
  const PriorityTitleStatus({
    Key? key,
    required this.priority,
    required this.title,
    required this.status,
    required this.color,
  }) : super(key: key);

  final String priority;
  final String title;
  final String status;
  final Color color;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.fromLTRB(25.0, 17.5, 0, 17.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width * 0.3,
            height: size.height * 0.025,
            decoration: BoxDecoration(
              color: color.withOpacity(0.25),
              borderRadius: BorderRadius.all(Radius.circular(10.0),),
            ),
            child: Center(
              child: Text(
                priority.toUpperCase() + " PRIORITY",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "NunitoSans",
                  fontWeight: FontWeight.w900,
                  color: color,
                ),
              ),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 25,
              fontFamily: "NunitoSans",
              fontWeight: FontWeight.w700,
              color: Color(0XFF344460),
            ),
          ),
          Text(
            status,
            style: TextStyle(
              fontSize: 18.5,
              fontFamily: "NunitoSans",
              fontWeight: FontWeight.w700,
              color: Color(0XFF344460).withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}