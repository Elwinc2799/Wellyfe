import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
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
      child: GlassmorphicContainer(
        width: size.width * 0.85,
        height: size.height * 0.34,
        borderRadius: 25,
        border: 2.5,
        blur: 0,
        linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFFFFFF).withOpacity(0.15),
            Color(0xFFFFFFFF).withOpacity(0.5),
          ],
          stops: [
            0.1,
            1,
          ]
        ),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFFFFFF).withOpacity(0.25),
            Color((0xFFFFFFFF)).withOpacity(0.75),
          ],
        ),
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
      ),
    );
  }
}