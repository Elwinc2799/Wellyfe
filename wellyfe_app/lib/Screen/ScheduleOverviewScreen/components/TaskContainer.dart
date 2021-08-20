import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:wellyfe_app/Screen/ScheduleOverviewScreen/components/TaskList.dart';

class TaskContainer extends StatelessWidget {
  const TaskContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GlassmorphicContainer(
      height: size.height * 0.315,
      width: size.width * 0.9,
      border: 2.5,
      borderRadius: 30,
      blur: 20,
      linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFFFFFFF).withOpacity(0.15),
          Color(0xFFFFFFFF).withOpacity(0.5),
        ],
        stops: [
          0.1,
          1,
        ]
      ),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFFFFFFF).withOpacity(0.25),
          Color((0xFFFFFFFF)).withOpacity(0.75),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0, 5.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: TaskList()
          ),
      ),
    );
  }
}