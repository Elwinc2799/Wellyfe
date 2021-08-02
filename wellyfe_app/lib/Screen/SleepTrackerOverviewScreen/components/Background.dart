import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/SleepTrackerOverviewScreen/components/Painter/BottomLeftPainter.dart';
import 'Painter/TopRightPainter.dart';

class Background extends StatelessWidget {
  const Background({
    Key? key,
    required this.children,
  }) : super(key: key);

  final Widget children;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          CustomPaint(
            size: MediaQuery.of(context).size,
            painter: TopRightPainter(),
          ),
          PositionedDirectional(
            bottom: -500,
            child: CustomPaint(
              size: MediaQuery.of(context).size,
              painter: BottomLeftPainter(),
            ),
          ),
          children,
        ],
      ),
    );
  }
}
