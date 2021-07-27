import 'package:flutter/material.dart';

class GraphTitle extends StatelessWidget {
  const GraphTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        children: [
          Text(
            "Priority",
            style: TextStyle(
              fontSize: 30,
              fontFamily: "NunitoSans",
              fontWeight: FontWeight.w800,
              color: Color(0XFF344460),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              "Task per day",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "NunitoSans",
                fontWeight: FontWeight.w800,
                color: Color(0XFF344460).withOpacity(0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}