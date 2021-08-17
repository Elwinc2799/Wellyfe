import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'package:wellyfe_app/Core/Data/TaskData.dart';
import 'package:wellyfe_app/Screen/ScheduleTimeScreen/components/DayIndividual.dart';
import 'package:wellyfe_app/Screen/ScheduleTimeScreen/components/TaskTimelineList.dart';


class DaysList extends StatefulWidget {
  @override
  _DaysListState createState() => _DaysListState();
}

class _DaysListState extends State<DaysList> {
  String groupValue = "Mo";

  static List<DateTime> getDaysInBetween() {
    DateTime now = DateTime.now();
    DateTime firstDayOfWeek = now.subtract(Duration(days: now.weekday - 1));
    DateTime lastDayOfWeek = now.add(Duration(days: DateTime.daysPerWeek - now.weekday));
    List<DateTime> days = [];

    for (int i = 0; i <= lastDayOfWeek.difference(firstDayOfWeek).inDays; i++)
      days.add(firstDayOfWeek.add(Duration(days: i)));

    return days;
  }

  final List<DateTime> days = getDaysInBetween();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        SizedBox(
          height: size.height * 0.085,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              for (var i = 0; i < days.length; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11),
                  child: NeumorphicRadio(
                    value: DateFormat('EEEE').format(days[i]).substring(0, 2),
                    onChanged: (dynamic value) {
                      setState(() {
                        groupValue = value;
                        TaskData.updateTaskDataList(value);
                        TaskTimelineList.listChanged();
                      });
                    },
                    groupValue: groupValue,
                    child: DayIndividual(
                      dayWord: DateFormat('EEEE').format(days[i]).substring(0, 2),
                      dayNumber: days[i].day,
                    ),
                    style: NeumorphicRadioStyle(
                      selectedColor: Colors.teal[50],
                      unselectedColor: Colors.white.withOpacity(0.5),
                      shape: NeumorphicShape.convex,
                      selectedDepth: 0,
                      unselectedDepth: 20,
                      lightSource: LightSource.top,
                    ),
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}


