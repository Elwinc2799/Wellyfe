import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wellyfe_app/Core/Model/Diary.dart';
import 'package:wellyfe_app/Screen/DiaryContentScreen/DiaryContentScreen.dart';
import 'package:wellyfe_app/Screen/DiaryDayListScreen/components/DiaryLeftPart.dart';
import 'package:wellyfe_app/Screen/DiaryDayListScreen/components/ImageRightContainer.dart';
import 'package:wellyfe_app/Screen/DiaryDayListScreen/components/NoImageRightContainer.dart';

class DiaryContainer extends StatelessWidget {
  const DiaryContainer({
    Key? key,
    required this.dayNumber,
    required this.dayString,
    required this.mood,
    required this.weather,
    required this.containImage,
    required this.content,
    required this.image,
    required this.title,
    required this.id,
  }) : super(key: key);

  final String dayNumber;
  final String dayString;
  final String mood;
  final String weather;
  final bool containImage;
  final String content;
  final String image;
  final String title;
  final String id;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(context, PageTransition(
          type: PageTransitionType.fade,
          child: DiaryContentScreen(
            diary: Diary.getSpecificDiary(id),
          ),
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
              dayNumber: dayNumber,
              dayString: dayString,
              mood: mood,
              weather: weather,
            ),
            containImage
                ? SizedBox(width: size.width * 0.01)
                : VerticalDivider(
                    thickness: 2,
                    width: size.width * 0.025,
                ),
            containImage
                ? ImageRightContainer(
                    image: image,
                  )
                : NoImageRightContainer(
                    content: title,
                  ),
          ],
        ),
      ),
    );
  }
}