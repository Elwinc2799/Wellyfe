import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class Stopwatch extends StatefulWidget {
  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ValueNotifier<bool> isRunning = ValueNotifier(true);

    final StopWatchTimer _stopWatchTimer = StopWatchTimer();
    _stopWatchTimer.onExecute.add(StopWatchExecute.start);

    return Column(
      children: [
        Text(
          "Slept for",
          style: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontWeight: FontWeight.w800,
            fontFamily: "Nunito",
            fontSize: 25,
          ),
        ),
        StreamBuilder<int>(
          stream: _stopWatchTimer.rawTime,
          initialData: _stopWatchTimer.rawTime.value,
          builder: (context, snapshot) {
            final value = snapshot.data!;
            final displayTime = StopWatchTimer.getDisplayTime(
              value,
              hours: true,
              minute: true,
              second: false,
              milliSecond: false,
            );
            return Text(
              displayTime,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontFamily: "Nunito",
                fontSize: 25,
              ),
            );
          }
        ),
        SizedBox(height: size.height * 0.05),
        GestureDetector(
          onTap: () {
            isRunning.value = !isRunning.value;

            if (!isRunning.value)
              _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
            else
              _stopWatchTimer.onExecute.add(StopWatchExecute.start);
          },
          child: Container(
            height: size.height * 0.05,
            width: size.width * 0.35,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                border: Border.all(
                    color: Colors.white.withOpacity(0.25),
                    width: 2
                ),
                borderRadius: BorderRadius.all(Radius.circular(15.0))
            ),
            child: Center(
                child: ValueListenableBuilder(
                  valueListenable: isRunning,
                  builder: (BuildContext context, bool flag, Widget? children) {
                    return Text(
                      isRunning.value ? "Stop" : "Start",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontWeight: FontWeight.w800,
                        fontFamily: "Nunito",
                        fontSize: 25,
                      ),
                    );
                  },
                )
            ),
          ),
        )
      ],
    );
  }
}

