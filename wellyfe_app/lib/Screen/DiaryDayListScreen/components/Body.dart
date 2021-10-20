import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellyfe_app/Core/Model/Diary.dart';
import 'package:wellyfe_app/Core/Providers/DiaryProvider.dart';
import 'package:wellyfe_app/Screen/DiaryDayListScreen/components/DiaryContainer.dart';
import 'package:wellyfe_app/Screen/DiaryDayListScreen/components/TopLevelBar.dart';
import 'package:wellyfe_app/Screen/DiaryOverviewScreen/components/Background.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.month,
  }) : super(key: key);

  final String month;

  @override
  Widget build(BuildContext context) {
    List<Diary> diaryList = Provider.of<DiaryProvider>(context).monthlyDiaryList;
    Size size = MediaQuery.of(context).size;

    return Background(
      children: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 75.0, 15.0, 0),
        child: Column(
          children: [
            TopLevelBar(month: month),
            SizedBox(height: size.height * 0.05),
            Container(
              height: size.height * 0.805,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: diaryList.isNotEmpty
                  ? Column(
                      children: List.generate(diaryList.length, (i) {
                        return Column(
                          children: [
                            DiaryContainer(
                              diary: diaryList[i],
                            ),
                            SizedBox(height: size.height * 0.015),
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
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                          child: Text(
                            "You haven't add any diary for this month",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 21,
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
            ),
          ],
        ),
      )
    );
  }
}






