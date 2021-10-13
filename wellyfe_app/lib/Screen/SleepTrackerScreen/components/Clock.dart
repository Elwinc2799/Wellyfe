import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Clock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 250,
          width: 250,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 5,
              )
          ),
          child: Center(
            child: StreamBuilder(
              stream: Stream.periodic(const Duration(minutes: 1)),
              builder: (context, snapshot) {
                return Text(
                  DateFormat('hh:mm a').format(DateTime.now()),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 45,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w400,
                      color: Colors.white
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}


