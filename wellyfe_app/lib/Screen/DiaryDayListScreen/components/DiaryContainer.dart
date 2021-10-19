import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:wellyfe_app/Core/Model/Diary.dart';
import 'package:wellyfe_app/Core/Providers/DiaryProvider.dart';
import 'package:wellyfe_app/Screen/DiaryContentScreen/DiaryContentScreen.dart';
import 'package:wellyfe_app/Screen/DiaryDayListScreen/components/DiaryLeftPart.dart';
import 'package:wellyfe_app/Screen/DiaryDayListScreen/components/ImageRightContainer.dart';
import 'package:wellyfe_app/Screen/DiaryDayListScreen/components/NoImageRightContainer.dart';

class DiaryContainer extends StatelessWidget {
  const DiaryContainer({
    Key? key,
    required this.diary,
  }) : super(key: key);

  final Diary diary;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Provider
          .of<DiaryProvider>(context, listen: false)
          .setDiary(diary);

        Navigator.push(context, PageTransition(
          type: PageTransitionType.fade,
          child: DiaryContentScreen(),
        ));
      },
      child: Container(
        height: size.height * 0.20,
        width: size.width * 0.80,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                  blurRadius: 5.0,
                  color: Colors.black.withOpacity(.25)
              )
            ]
        ),
        child: Row(
          children: [
            DiaryLeftPart(
              dayNumber: diary.dateTime.day.toString(),
              dayString: DateFormat('E').format(diary.dateTime),
              mood: diary.mood,
              weather: diary.weather,
            ),
            diary.picture != ""
                ? SizedBox(width: size.width * 0.01)
                : VerticalDivider(
                    thickness: 2,
                    width: size.width * 0.025,
                ),
            diary.picture != ""
                ? ImageRightContainer(
                    image: diary.picture,
                  )
                : NoImageRightContainer(
                    content: diary.title,
                  ),
          ],
        ),
      ),
    );
  }
}