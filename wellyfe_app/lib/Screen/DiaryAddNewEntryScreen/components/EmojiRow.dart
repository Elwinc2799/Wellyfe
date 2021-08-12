import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class EmojiRow extends StatefulWidget {
  @override
  _EmojiRowState createState() => _EmojiRowState();
}

class _EmojiRowState extends State<EmojiRow> {
  bool favourite = false;
  ValueNotifier<String> emoji = ValueNotifier("happy");
  ValueNotifier<String> weather = ValueNotifier("sunny");
  List<String> emojiList = [
    "happy", "very happy", "sad", "sleepy", "annoyed", "angry", "in love", "surprised",
  ];
  List<String> weatherList = [
    "sunny", "rainy", "thunderstorm", "cloudy", "overcast", "snow", "windy", "foggy",
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.075,
      width: size.width * 0.4,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                buildEmojiModalBottomSheet(context, size);
              },
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                height: 50,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Image(image: AssetImage("assets/logo/${emoji.value}.png")),
              )
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  favourite = !favourite;
                });
              },
              child: AnimatedContainer(
                height: 50,
                curve: Curves.fastOutSlowIn,
                duration: const Duration(seconds: 1),
                child: favourite
                    ? Image(image: AssetImage("assets/logo/heartFilled.png"))
                    : Image(image: AssetImage("assets/logo/heart.png")),
              )
            ),
            GestureDetector(
              onTap: () {
                buildWeatherModalBottomSheet(context, size);
              },
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                height: 50,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Image(image: AssetImage("assets/logo/${weather.value}.png"))
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> buildEmojiModalBottomSheet(BuildContext context, Size size) {
    return showCupertinoModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: size.height * 0.2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (var i = 0; i < emojiList.length; i += 4)
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (var j = i; j < i + 4; j++)
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              emoji.value = emojiList[j];
                            });
                          },
                          child: Image(image: AssetImage("assets/emoji/${emojiList[j]}.png"))
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.025),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> buildWeatherModalBottomSheet(BuildContext context, Size size) {
    return showCupertinoModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: size.height * 0.2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (var i = 0; i < weatherList.length; i += 4)
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (var j = i; j < i + 4; j++)
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  weather.value = weatherList[j];
                                });
                              },
                              child: Image(image: AssetImage("assets/weather/${weatherList[j]}.png"))
                          ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.025),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}

