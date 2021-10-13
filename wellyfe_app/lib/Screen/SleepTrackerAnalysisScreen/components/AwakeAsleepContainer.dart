import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/SleepTrackerAnalysisScreen/components/AwakeAsleepLineChart.dart';
import 'package:wellyfe_app/Screen/SleepTrackerAnalysisScreen/components/LegendIndividual.dart';

class AwakeAsleepContainer extends StatelessWidget {
  const AwakeAsleepContainer({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Container(
          width: size.width * 0.9,
          height: size.height * 0.3,
          decoration: BoxDecoration(
              color: Color(0XFFF4F9FF),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              boxShadow: [
                BoxShadow(
                    blurRadius: 5.0,
                    offset: Offset(-3, -3),
                    color: Colors.grey.withOpacity(0.1)
                ),
                BoxShadow(
                    blurRadius: 5.0,
                    offset: Offset(3, 3),
                    color: Colors.black.withOpacity(.25)
                )
              ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.0125),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 15.0, top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Analysis",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            color: Color(0XFF394D70),
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Time of awake and asleep',
                          style: TextStyle(
                            color: Color(0XFF394D70).withOpacity(0.5),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: "NunitoSans",
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          LegendIndividual(
                            color: Colors.red,
                            indicator: "Awake"
                          ),
                          LegendIndividual(
                              color: Color(0XFF1EA9E4),
                              indicator: "Asleep"
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Stack(
                  children: [
                    AwakeLineChart(),
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}