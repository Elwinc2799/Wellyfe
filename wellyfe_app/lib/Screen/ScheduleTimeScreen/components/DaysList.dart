import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wellyfe_app/Core/Model/RadioModel.dart';
import 'package:wellyfe_app/Core/Model/Task.dart';
import 'package:wellyfe_app/Screen/ScheduleTimeScreen/components/RadioItem.dart';
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
  List<RadioModel> sampleData = [];

  @override
  Widget build(BuildContext context) {

    List.generate(days.length, (index) => {
      sampleData.add(RadioModel(DateFormat('EEEE').format(days[index]).substring(0, 2), false))
    });

    Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        SizedBox(
          height: size.height * 0.085,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: List.generate(days.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      sampleData.forEach((element) => element.isSelected = false);
                      sampleData[index].isSelected = true;
                      Task.updateTaskDataList(sampleData[index].buttonText);
                      TaskTimelineList.listChanged();
                    });
                  },
                  child: RadioItem(
                    text: sampleData[index].buttonText,
                    isSelected: sampleData[index].isSelected,
                  ),
                ),
                // child: NeumorphicRadio(
                //   value: DateFormat('EEEE').format(days[index]).substring(0, 2),
                //   onChanged: (dynamic value) {
                //     setState(() {
                //       groupValue = value;
                //       Task.updateTaskDataList(value);
                //       TaskTimelineList.listChanged();
                //     });
                //   },
                //   groupValue: groupValue,
                //   child: DayIndividual(
                //     dayWord: DateFormat('EEEE').format(days[index]).substring(0, 2),
                //     dayNumber: days[index].day,
                //   ),
                //   style: NeumorphicRadioStyle(
                //     selectedColor: Colors.teal[50],
                //     unselectedColor: Colors.white.withOpacity(0.5),
                //     shape: NeumorphicShape.convex,
                //     selectedDepth: 0,
                //     unselectedDepth: 20,
                //     lightSource: LightSource.top,
                //   ),
                // ),
              );
            })
          ),
        )
      ],
    );
  }
}


