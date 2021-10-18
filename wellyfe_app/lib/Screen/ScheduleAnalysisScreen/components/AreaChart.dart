import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wellyfe_app/Core/Model/Task.dart';
import 'package:wellyfe_app/Core/Providers/TaskProvider.dart';

class AreaChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Task> weeklyTaskList = Provider.of<TaskProvider>(context).taskList;
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        height: size.height * 0.24,
        width: size.width * 0.8,
        child: SfCartesianChart(
          plotAreaBorderWidth: 0,
          primaryXAxis: CategoryAxis(
            majorGridLines: MajorGridLines(
              width: 0,
            ),
            labelStyle: TextStyle(
              fontSize: 12.5,
              fontFamily: "NunitoSans",
              fontWeight: FontWeight.w800,
              color: Color(0XFF344460).withOpacity(0.7),
            ),
            majorTickLines: MajorTickLines(
                width: 0
            )
          ),
          primaryYAxis: NumericAxis(
            interval: 1,
            majorGridLines: MajorGridLines(
              width: 0,
            ),
            labelStyle: TextStyle(
              fontSize: 12.5,
              fontFamily: "NunitoSans",
              fontWeight: FontWeight.w800,
              color: Color(0XFF344460).withOpacity(0.7),
            ),
            majorTickLines: MajorTickLines(
                width: 0
            )
          ),
          series: <ChartSeries>[
            SplineAreaSeries<Task, String>(
              splineType: SplineType.cardinal,
              cardinalSplineTension: 1,
              color: Color(0XFF668ED4).withOpacity(0.5),
              dataSource: weeklyTaskList,
              xValueMapper: (Task taskData, _) => DateFormat('EEEE').format(taskData.dueDate).substring(0, 3),
              yValueMapper: (Task taskData, _) => taskData.switchDateOccurrences(weeklyTaskList) + taskData.switchDateOccurrences(weeklyTaskList) * 0.25,
            ),
            SplineAreaSeries<Task, String>(
              splineType: SplineType.cardinal,
              cardinalSplineTension: 1,
              color: Color(0XFF668ED4),
              dataSource: weeklyTaskList,
              xValueMapper: (Task taskData, _) => DateFormat('EEEE').format(taskData.dueDate).substring(0, 3),
              yValueMapper: (Task taskData, _) => taskData.switchDateOccurrences(weeklyTaskList),
            ),
          ],
        ),
      ),
    );
  }
}
