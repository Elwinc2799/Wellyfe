import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TopLevelBar extends StatelessWidget {
  const TopLevelBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(17.5, 75.0, 17.5, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "How are you today?",
            style: TextStyle(
              fontSize: 20,
              fontFamily: "NunitoSans",
              color: Color(0XFF394D70).withOpacity(0.5),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}