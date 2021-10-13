import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeightLineChart extends StatefulWidget {
  @override
  _WeightLineChartState createState() => _WeightLineChartState();
}

class _WeightLineChartState extends State<WeightLineChart> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5,
      child: LineChart(
          weightData(),
      ),
    );
  }

  LineChartData weightData() {
    return LineChartData(
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => TextStyle(
            color: Color(0XFF68737D),
              fontWeight: FontWeight.bold,
              fontSize: 17.5
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'J';
              case 2:
                return 'F';
              case 3:
                return 'M';
              case 4:
                return 'A';
              case 5:
                return 'M';
              case 6:
                return 'J';
              case 7:
                return 'J';
              case 8:
                return 'A';
              case 9:
                return 'S';
              case 10:
                return 'O';
              case 11:
                return 'N';
              case 12:
                return 'D';
            }
            return '';
          },
          margin: 20,
        ),
        leftTitles: SideTitles(showTitles: false),
      ),
      borderData: FlBorderData(show: false),
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3),
            FlSpot(1, 3),
            FlSpot(2, 2),
            FlSpot(3, 5),
            FlSpot(4, 3.1),
            FlSpot(5, 4),
            FlSpot(6, 3),
            FlSpot(7, 4),
            FlSpot(8, 3.1),
            FlSpot(9, 4),
            FlSpot(10, 3),
            FlSpot(11, 4),
            FlSpot(12, 4),
            FlSpot(13, 3),
          ],
          isCurved: true,
          colors: [Colors.indigo],
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(show: false),
        ),
      ]
    );
  }
}


