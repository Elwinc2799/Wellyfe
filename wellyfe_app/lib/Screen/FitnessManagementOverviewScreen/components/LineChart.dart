import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StepsLineChart extends StatefulWidget {
  @override
  _StepsLineChartState createState() => _StepsLineChartState();
}

class _StepsLineChartState extends State<StepsLineChart> {
  List<Color> gradientColors = [
    const Color(0XFFFFFFFF).withOpacity(0.25),
  ];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4,
      child: LineChart(StepsLineChartData())
    );
  }

  LineChartData StepsLineChartData() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
        touchCallback: (LineTouchResponse touchResponse) {},
        handleBuiltInTouches: true,
      ),
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
        show: true,
        leftTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontWeight: FontWeight.bold,
            fontSize: 14
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'JAN';
              case 2:
                return 'FEB';
              case 3:
                return 'MAR';
              case 4:
                return 'APR';
              case 5:
                return 'MAY';
              case 6:
                return 'JUN';
              case 7:
                return 'JUL';
              case 8:
                return 'AUG';
              case 9:
                return 'SEP';
              case 10:
                return 'OCT';
              case 11:
                return 'NOV';
              case 12:
                return 'DEC';
            }
            return '';
          },
        )
      ),
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 0),
            FlSpot(1, 10000),
            FlSpot(2, 3000),
            FlSpot(3, 3000),
            FlSpot(4, 3000),
            FlSpot(5, 4000),
            FlSpot(6, 3000),
            FlSpot(7, 3000),
            FlSpot(8, 5000),
            FlSpot(9, 3000),
            FlSpot(10, 4000),
            FlSpot(11, 3000),
            FlSpot(12, 3000),
            FlSpot(13, 0),
          ],
          isCurved: true,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(show: false),
          colors: [Color(0XFFD57FB1)],
          barWidth: 4,
        )
      ]
    );
  }
}

