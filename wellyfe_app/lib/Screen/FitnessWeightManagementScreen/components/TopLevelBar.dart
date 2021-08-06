import 'package:flutter/material.dart';

class TopLevelBar extends StatelessWidget {
  const TopLevelBar({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        children: [
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0XFF394D70)
            ),
          ),
          SizedBox(width: size.width * 0.025),
          Text(
            "Activity",
            style: TextStyle(
              fontSize: 30,
              fontFamily: "NunitoSans",
              color: Color(0XFF394D70),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(width: size.width * 0.05),
          GestureDetector(
            child: Text(
              "Health Status",
              style: TextStyle(
                fontSize: 30,
                fontFamily: "NunitoSans",
                color: Colors.grey.withOpacity(0.5),
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}
