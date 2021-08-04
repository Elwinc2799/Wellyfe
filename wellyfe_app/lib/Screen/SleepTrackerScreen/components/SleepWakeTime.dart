import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:wellyfe_app/Screen/SleepTrackerScreen/components/TitleTime.dart';

class SleepWakeTime extends StatefulWidget {
  @override
  _SleepWakeTimeState createState() => _SleepWakeTimeState();
}

class _SleepWakeTimeState extends State<SleepWakeTime> {
  //TODO GET DATA FROM DATABASE
  ValueNotifier<String> sleepTime = ValueNotifier("10:00 PM");
  ValueNotifier<String> wakeTime = ValueNotifier("6:00 AM");

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () async {
            TimeOfDay? _selectedTime;

            TimeOfDay? timePicked = await showRoundedTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );

            if (timePicked != null)
              setState(() {
                _selectedTime = timePicked;
              });

            DateTime tempDate = DateFormat("hh:mm").parse(
                _selectedTime!.hour.toString() +
                    ":" + _selectedTime!.minute.toString());

            sleepTime.value = DateFormat("h:mm a").format(tempDate);
          },
          child: ValueListenableBuilder(
            valueListenable: sleepTime,
            builder: (BuildContext context, String list, Widget? children) {
              return TitleTime(
                title: "In The\nBed At",
                time: sleepTime.value,
              );
            },
          ),
        ),
        GestureDetector(
          onTap: () async {
            TimeOfDay? _selectedTime;

            TimeOfDay? timePicked = await showRoundedTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );

            if (timePicked != null)
              setState(() {
                _selectedTime = timePicked;
              });

            DateTime tempDate = DateFormat("hh:mm").parse(
                _selectedTime!.hour.toString() +
                    ":" + _selectedTime!.minute.toString());

            wakeTime.value = DateFormat("h:mm a").format(tempDate);
          },
          child: ValueListenableBuilder(
            valueListenable: wakeTime,
            builder: (BuildContext context, String list, Widget? children) {
              return TitleTime(
                title: "Out Of\nBed At",
                time: wakeTime.value,
              );
            }
          ),
        )
      ],
    );
  }
}
