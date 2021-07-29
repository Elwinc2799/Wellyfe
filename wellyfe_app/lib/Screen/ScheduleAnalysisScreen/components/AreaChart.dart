import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wellyfe_app/Core/Data/TaskData.dart';

class AreaChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        height: size.height * 0.225,
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
            interval: 1, //TODO CHANGE INTERVAL TO SUM / 4
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
            SplineAreaSeries<TaskData, String>(
              splineType: SplineType.cardinal,
              cardinalSplineTension: 1,
              color: Color(0XFF668ED4).withOpacity(0.5),
              dataSource: TaskData.taskDataList,
              xValueMapper: (TaskData taskData, _) => DateFormat('EEEE').format(taskData.dateTime).substring(0, 3),
              yValueMapper: (TaskData taskData, _) => taskData.switchDateOccurrences(TaskData.taskDataList) + taskData.switchDateOccurrences(TaskData.taskDataList) * 0.25,
            ),
            SplineAreaSeries<TaskData, String>(
              splineType: SplineType.cardinal,
              cardinalSplineTension: 1,
              color: Color(0XFF668ED4),
              dataSource: TaskData.taskDataList,
              xValueMapper: (TaskData taskData, _) => DateFormat('EEEE').format(taskData.dateTime).substring(0, 3),
              yValueMapper: (TaskData taskData, _) => taskData.switchDateOccurrences(TaskData.taskDataList),
            ),
          ],
        ),
      ),
    );
  }
}
