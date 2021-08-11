import 'package:flutter/material.dart';
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
  }) : super(key: key);

  final String dayNumber;
  final String dayString;
  final String mood;
  final String weather;
  final bool containImage;
  final String content;
  final String image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.25,
      width: size.width * 0.85,
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
                  image: "assets/pictures/testing.png",
                )
              : NoImageRightContainer(
                  content: "My diary",
                ),
        ],
      ),
    );
  }
}