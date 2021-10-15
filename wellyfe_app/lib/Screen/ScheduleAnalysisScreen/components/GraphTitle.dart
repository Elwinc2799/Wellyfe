import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/ScheduleAnalysisScreen/components/LegendIndividual.dart';

class GraphTitle extends StatelessWidget {
  const GraphTitle({
    Key? key,
    required this.title,
    required this.isBubble,
  }) : super(key: key);

  final String title;
  final bool isBubble;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: "NunitoSans",
                  fontWeight: FontWeight.w800,
                  color: Color(0XFFB8C6DE),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  "Task per day",
                  style: TextStyle(
                    fontSize: 14.5,
                    fontFamily: "NunitoSans",
                    fontWeight: FontWeight.w800,
                    color: Color(0XFF344460).withOpacity(0.5),
                  ),
                ),
              ),
            ],
          ),
          isBubble
          ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LegendIndividual(
                priority: "Low",
                color: Color(0XFF1CB3B2),
              ),
              LegendIndividual(
                priority: "Medium",
                color: Color(0XFF8677FE),
              ),
              LegendIndividual(
                priority: "High",
                color: Color(0XFFFB5A7E),
              ),
            ],
          )
          : Container(),
        ],
      ),
    );
  }
}