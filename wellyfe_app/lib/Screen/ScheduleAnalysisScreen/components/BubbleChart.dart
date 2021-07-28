import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wellyfe_app/Core/Data/TaskData.dart';

class BubbleChart extends StatelessWidget {
  final List<TaskData> taskDataList = [
    TaskData("Testing 1", 1, DateTime.utc(2021, DateTime.july, 26), false, "Ongoing"),
    TaskData("Testing 5", 1, DateTime.utc(2021, DateTime.july, 26), false, "Ongoing"),
    TaskData("Testing 5", 3, DateTime.utc(2021, DateTime.july, 27), false, "Ongoing"),
    TaskData("Testing 2", 2, DateTime.utc(2021, DateTime.july, 28), false, "Ongoing"),
    TaskData("Testing 3", 3, DateTime.utc(2021, DateTime.july, 29), false, "Ongoing"),
    TaskData("Testing 4", 3, DateTime.utc(2021, DateTime.july, 30), false, "Ongoing"),
    TaskData("Testing 6", 1, DateTime.utc(2021, DateTime.july, 31), false, "Ongoing"),
    TaskData("Testing 7", 1, DateTime.utc(2021, DateTime.july, 25), false, "Ongoing"),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        height: size.height * 0.2,
        width: size.width * 0.8,
        child: SfCartesianChart(
          plotAreaBorderWidth: 0,
          primaryXAxis: CategoryAxis(
            majorGridLines: MajorGridLines(
              width: 0,
            ),
            labelStyle: TextStyle(
              fontSize: 17.5,
              fontFamily: "NunitoSans",
              fontWeight: FontWeight.w800,
              color: Color(0XFF344460).withOpacity(0.7),
            ),
            majorTickLines: MajorTickLines(
              width: 0
            )
          ),
          primaryYAxis: NumericAxis(
            minimum: 0,
            maximum: 4,
            interval: 1,
            majorGridLines: MajorGridLines(
              width: 0,
            ),
            labelStyle: TextStyle(
              fontSize: 17.5,
              fontFamily: "NunitoSans",
              fontWeight: FontWeight.w800,
              color: Color(0XFF344460).withOpacity(0.7),
            ),
            majorTickLines: MajorTickLines(
              width: 0
            )
          ),
          series: <ChartSeries>[
            BubbleSeries<TaskData, String>(
              dataSource: taskDataList,
              sizeValueMapper: (TaskData taskData, _) => taskData.switchOccurrences(taskDataList),
              pointColorMapper: (TaskData taskData, _) => taskData.findColor(),
              xValueMapper: (TaskData taskData, _) => DateFormat('EEEE').format(taskData.dateTime).substring(0, 3),
              yValueMapper: (TaskData taskData, _) => taskData.taskPriority,
              minimumRadius: 5,
              maximumRadius: 7,
            )
          ],
        ),
      ),
    );
  }
}
