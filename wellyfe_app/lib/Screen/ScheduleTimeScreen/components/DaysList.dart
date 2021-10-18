import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wellyfe_app/Core/Model/RadioModel.dart';
import 'package:wellyfe_app/Core/Model/Task.dart';
import 'package:wellyfe_app/Core/Providers/TaskProvider.dart';
import 'package:wellyfe_app/Screen/ScheduleTimeScreen/components/DaysRadioItem.dart';
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
  List<RadioModel> daysList = [];

  @override
  Widget build(BuildContext context) {

    List.generate(days.length, (index) => {
      if (index == 0)
        daysList.add(RadioModel(DateFormat('EEEE').format(days[index]).substring(0, 2), true))
      else
        daysList.add(RadioModel(DateFormat('EEEE').format(days[index]).substring(0, 2), false))
    });

    Size size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: size.height * 0.085,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: List.generate(days.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7.5),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      daysList.forEach((element) => element.isSelected = false);
                      daysList[index].isSelected = true;

                      Provider
                          .of<TaskProvider>(context, listen: false)
                          .setDailyTaskList(daysList[index].buttonText);

                    });
                  },
                  child: DaysRadioItem(
                    text: daysList[index].buttonText,
                    isSelected: daysList[index].isSelected,
                  ),
                ),
              );
            })
          ),
        )
      ],
    );
  }
}


