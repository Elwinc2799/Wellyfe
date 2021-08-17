import 'package:flutter/material.dart';

class DayIndividual extends StatefulWidget {
  @override
  _DayIndividualState createState() => _DayIndividualState();

  const DayIndividual({
    Key? key,
    required this.dayWord,
    required this.dayNumber,
  }) : super(key: key);

  final String dayWord;
  final int dayNumber;
}

class _DayIndividualState extends State<DayIndividual> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      height: size.height * 0.085,
      width: size.width * 0.1,
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.dayWord,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "NunitoSans",
                    fontWeight: FontWeight.w800,
                    color: Color(0XFF344460).withOpacity(0.5),
                  ),
                ),
                Text(
                  widget.dayNumber.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "NunitoSans",
                    fontWeight: FontWeight.w800,
                    color: Color(0XFF344460).withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          // widget.isHighPriority
          //  ? Positioned(
          //   top: 5,
          //   right: 10,
          //   child: Container(
          //     height: 10,
          //     width: 10,
          //     decoration: BoxDecoration(
          //         color: Color(0xFFD11149),
          //         shape: BoxShape.circle
          //     ),
          //   ),
          // )
          // : Container(),
        ],
      ),
    );
  }
}

