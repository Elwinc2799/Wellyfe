import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AwakeLineChart extends StatefulWidget {
  @override
  _AwakeLineChartState createState() => _AwakeLineChartState();
}

class _AwakeLineChartState extends State<AwakeLineChart> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 2,
        child: LineChart(AwakeLineChartData()),
    );
  }

  LineChartData AwakeLineChartData() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.white.withOpacity(0.8),
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
          margin: 10,
          getTextStyles: (value) => TextStyle(
              color: Color(0XFF394D70).withOpacity(0.35),
              fontWeight: FontWeight.bold,
              fontSize: 10
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
        ),
      ),

      lineBarsData: linesBarData(),
    );
  }

  List<LineChartBarData> linesBarData() {
    final awakeLineChartBarData = LineChartBarData(
      spots: [
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
      ],
      isCurved: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
      colors: [Colors.red],
      barWidth: 3,
    );

    final asleepLineChartBarData = LineChartBarData(
      spots: [
        FlSpot(1, 7000),
        FlSpot(2, 2000),
        FlSpot(3, 8000),
        FlSpot(4, 1000),
        FlSpot(5, 9000),
        FlSpot(6, 5000),
        FlSpot(7, 3800),
        FlSpot(8, 5900),
        FlSpot(9, 3700),
        FlSpot(10, 7400),
        FlSpot(11, 3000),
        FlSpot(12, 3000),
      ],
      isCurved: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
      colors: [Color(0XFF1EA9E4)],
      barWidth: 3,
    );

    return [
      awakeLineChartBarData,
      asleepLineChartBarData
    ];
  }
}



