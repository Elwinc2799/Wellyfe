import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wellyfe_app/Core/Model/Mood.dart';
import 'package:wellyfe_app/Screen/HomeMoodScreen/components/Background.dart';
import 'package:wellyfe_app/Screen/HomeMoodScreen/components/MonthData.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var uniqueMonth = Mood.getMonthList();

    return Background(
      children: Padding(
        padding: const EdgeInsets.symmetric(vertical: 75),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "My Mood",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: "Montserrat",
                  color: Color(0XFF394D70),
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Container(
                height: size.height * 0.5,
                width: size.width,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Column(
                        children: List.generate(uniqueMonth.length, (index) {
                          return Column(
                            children: [
                              MonthData(
                                month: DateFormat('MMMM').format(uniqueMonth[index].date),
                                moodList: Mood.getMonthlyMoodList(uniqueMonth[index].date.month),
                              ),
                              SizedBox(height: size.height * 0.025),
                            ],
                          );
                        }),
                      )
                    ],
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


