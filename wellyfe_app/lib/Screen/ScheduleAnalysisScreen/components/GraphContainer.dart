import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/ScheduleAnalysisScreen/components/BubbleChart.dart';
import 'package:wellyfe_app/Screen/ScheduleAnalysisScreen/components/GraphLabel.dart';
import 'package:wellyfe_app/constants.dart';

class GraphContainer extends StatelessWidget {
  const GraphContainer({
    Key? key,
    required this.isBubble,
  }) : super(key: key);

  final bool isBubble;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GraphTitle(),
            BubbleChart(),
          ],
        ),
      ),
      decoration: BoxDecoration(
          color: backgroundColor.withOpacity(0.8),
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
    );
  }
}