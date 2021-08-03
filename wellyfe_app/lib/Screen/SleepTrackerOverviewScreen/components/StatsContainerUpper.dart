import 'package:flutter/material.dart';

class StatsContainerUpper extends StatelessWidget {
  const StatsContainerUpper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          StatsContainerIndividualUpper(
            isOnTheLeft: true,
          ),
          SizedBox(width: size.width * 0.05),
          StatsContainerIndividualUpper(
            isOnTheLeft: false,
          ),
        ],
      ),
    );
  }
}

class StatsContainerIndividualUpper extends StatelessWidget {
  const StatsContainerIndividualUpper({
    Key? key,
    required this.isOnTheLeft,
  }) : super(key: key);

  final bool isOnTheLeft;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.2,
      width: size.width * 0.35,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color(0XFF373749),
              Color(0XFF4D4D65),
            ],
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 5.0,
              color: Colors.black54,
              offset: Offset(3.0, 3.0),
            ),
            BoxShadow(
              blurRadius: 5.0,
              color: Color(0XFF303030),
              offset: Offset(-3.0, -3.0),
            )
          ],
          borderRadius: BorderRadius.only(
            topLeft: isOnTheLeft ? Radius.circular(5.0) : Radius.circular(50.0),
            topRight: isOnTheLeft ? Radius.circular(50.0) : Radius.circular(5.0),
            bottomRight: isOnTheLeft ? Radius.circular(5.0) : Radius.circular(50.0),
            bottomLeft: isOnTheLeft ? Radius.circular(50.0) : Radius.circular(5.0),
          )
      ),
    );
  }
}