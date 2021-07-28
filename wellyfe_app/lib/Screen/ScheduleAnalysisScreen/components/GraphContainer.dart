import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/ScheduleAnalysisScreen/components/AreaChart.dart';
import 'package:wellyfe_app/Screen/ScheduleAnalysisScreen/components/BubbleChart.dart';
import 'package:wellyfe_app/Screen/ScheduleAnalysisScreen/components/GraphTitle.dart';

class GraphContainer extends StatelessWidget {
  const GraphContainer({
    Key? key,
    required this.isBubble,
    required this.title,
  }) : super(key: key);

  final bool isBubble;
  final String title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: size.width * 0.85,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GraphTitle(
                title: title,
                isBubble: isBubble,
              ),
              Center(
                child: isBubble ? BubbleChart() : AreaChart(),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Color(0xFFE0E5EC),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          boxShadow: [
            BoxShadow(
              blurRadius: 5.0,
              offset: Offset(-3, -3),
              color: Colors.white
            ),
            BoxShadow(
              blurRadius: 5.0,
              offset: Offset(3, 3),
              color: Colors.black.withOpacity(.25)
            )
          ]
        ),
      ),
    );
  }
}