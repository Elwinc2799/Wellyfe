import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Clock extends StatelessWidget {
  const Clock({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275,
      width: 275,
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
              DateFormat('h:mm a').format(DateTime.now()),
              style: TextStyle(
                  fontSize: 60,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w400,
                  color: Colors.white
              ),
            );
          },
        ),
      ),
    );
  }
}
