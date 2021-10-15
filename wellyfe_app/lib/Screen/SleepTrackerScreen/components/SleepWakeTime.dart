import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
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
  TimeOfDay _sleepTime = TimeOfDay(hour: 22, minute: 00);
  TimeOfDay _awakeTime = TimeOfDay(hour: 6, minute: 00);

  void onSleepTimeChanged(TimeOfDay newTime) {
    setState(() {
      _sleepTime = newTime;
    });
  }

  void onAwakeTimeChanged(TimeOfDay newTime) {
    setState(() {
      _awakeTime = newTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () async {
            Navigator.of(context).push(
              showPicker(
                context: context,
                value: _sleepTime,
                onChange: onSleepTimeChanged,
                minuteInterval: MinuteInterval.FIVE,
                iosStylePicker: true,
                disableHour: false,
                disableMinute: false,
                minMinute: 0,
                maxMinute: 56,
                onChangeDateTime: (DateTime dateTime) {
                  DateTime tempDate = DateFormat("hh:mm").parse(
                      dateTime.hour.toString() + ":" + dateTime.minute.toString());

                  sleepTime.value = DateFormat("h:mm a").format(tempDate);
                },
              ),
            );
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
            Navigator.of(context).push(
              showPicker(
                context: context,
                value: _awakeTime,
                onChange: onAwakeTimeChanged,
                minuteInterval: MinuteInterval.FIVE,
                iosStylePicker: true,
                disableHour: false,
                disableMinute: false,
                minMinute: 0,
                maxMinute: 56,
                onChangeDateTime: (DateTime dateTime) {
                  DateTime tempDate = DateFormat("hh:mm").parse(
                      dateTime.hour.toString() + ":" + dateTime.minute.toString());

                  wakeTime.value = DateFormat("h:mm a").format(tempDate);
                },
              ),
            );
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
