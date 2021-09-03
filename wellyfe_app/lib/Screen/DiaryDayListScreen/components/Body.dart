import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wellyfe_app/Core/Model/Diary.dart';
import 'package:wellyfe_app/Screen/DiaryDayListScreen/components/DiaryContainer.dart';
import 'package:wellyfe_app/Screen/DiaryDayListScreen/components/TopLevelBar.dart';
import 'package:wellyfe_app/Screen/DiaryOverviewScreen/components/Background.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.diaryList,
    required this.month,
  }) : super(key: key);

  final List<Diary> diaryList;
  final String month;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      children: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 30.0),
        child: Column(
          children: [
            TopLevelBar(month: month),
            SizedBox(height: size.height * 0.05),
            Container(
              height: size.height * 0.7,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: diaryList.isNotEmpty
                  ? Column(
                      children: List.generate(Diary.diaryDataList.length, (i) {
                        return Column(
                          children: [
                            DiaryContainer(
                              dayNumber: diaryList[i].dateTime.day.toString(),
                              dayString: DateFormat('E').format(diaryList[i].dateTime),
                              mood: diaryList[i].mood,
                              weather: diaryList[i].weather,
                              containImage: (diaryList[i].picture != ""),
                              content: diaryList[i].content,
                              image: diaryList[i].picture,
                              title: diaryList[i].title,
                              id: diaryList[i].diaryID,
                            ),
                            SizedBox(height: size.height * 0.03),
                          ],
                        );
                      }),
                  )
                  : Container(
                    child: Column(
                      children: [
                        SizedBox(height: size.height * 0.1),
                        Image(image: AssetImage("assets/pictures/emptyDiary.png")),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                          child: Text(
                            "You haven't add any diary for this month",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: "Montserrat",
                              color: Color(0XFF394D70),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}






