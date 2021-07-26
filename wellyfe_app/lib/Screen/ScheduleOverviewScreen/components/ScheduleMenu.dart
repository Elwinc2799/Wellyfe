import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/ScheduleOverviewScreen/components/ScheduleMenuIndividual.dart';

class ScheduleMenu extends StatelessWidget {
  const ScheduleMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ScheduleMenuIndividual(
                asset: "assets/logo/done.png",
                title: "Completed",
                total: 32,
              ),
              ScheduleMenuIndividual(
                asset: "assets/logo/pending.png",
                title: "Pending",
                total: 32,
              ),
            ],
          ),
          SizedBox(height: size.height * 0.025),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ScheduleMenuIndividual(
                asset: "assets/logo/cancel.png",
                title: "Canceled",
                total: 32,
              ),
              ScheduleMenuIndividual(
                asset: "assets/logo/ongoing.png",
                title: "Ongoing",
                total: 32,
              ),
            ],
          ),
        ],
      ),
    );
  }
}