import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:wellyfe_app/Core/Model/Diary.dart';
import 'package:wellyfe_app/Screen/DiaryAddNewEntryScreen/components/PictureContainer.dart';
import 'package:wellyfe_app/Screen/DiaryAddNewEntryScreen/components/TopLevelBar.dart';
import 'package:wellyfe_app/Screen/DiaryOverviewScreen/components/Background.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  bool favourite = false;
  ValueNotifier<String> emoji = ValueNotifier("happy");
  ValueNotifier<String> weather = ValueNotifier("sunny");
  List<String> emojiList = [
    "happy", "very happy", "sad", "sleepy", "annoyed", "angry", "in love", "surprised",
  ];
  List<String> weatherList = [
    "sunny", "rainy", "thunderstorm", "cloudy", "overcast", "snow", "windy", "foggy",
  ];

  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  var firebaseUser =  FirebaseAuth.instance.currentUser;
  final firestoreInstance = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
        children: Padding(
          padding: const EdgeInsets.symmetric(vertical: 75.0),
          child: Column(
            children: [
              TopLevelBar(
                function: () {
                  addNewDiary(
                    _titleController.text,
                    _contentController.text,
                    emoji.value,
                    weather.value,
                    favourite,
                  );
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                height: size.height * 0.775,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      PictureContainer(),
                      SizedBox(height: size.height * 0.03),
                      Center(
                          child: Form(
                            child: Column(
                              children: [
                                buildTitleContainer(),
                                buildEmojiContainer(),
                                buildContentContainer(),
                              ],
                            ),
                          ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }

  Future<void> addNewDiary(String title, String content, String mood, String weather, bool favourite) async {
    DocumentReference documentReference = await firestoreInstance
      .collection("diaries")
      .doc(firebaseUser!.uid)
      .collection("diary")
      .add({
        "title": title,
        "content": content,
        "mood": mood,
        "weather": weather,
        "favourite": favourite,
        "date": DateTime.now(),
        "image": Diary.newImageUrl,
    });

    Diary.diaryDataList.add(
        Diary(
          documentReference.id,
          title,
          content,
          mood,
          weather,
          Diary.newImageUrl,
          favourite,
          DateTime.now(),
        )
    );

    Diary.newImageUrl = "";
  }

  Container buildEmojiContainer() {
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
                  height: 50,
                  width: 50,
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
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
                  width: 50,
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
                  height: 50,
                  width: 50,
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Image(image: AssetImage("assets/logo/${weather.value}.png"))
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildContentContainer() {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.8,
      height: size.height * 0.25,
      child: TextField(
        scrollPhysics: BouncingScrollPhysics(),
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(
          hintText: "How was your day?",
          hintStyle: TextStyle(
            fontSize: 30,
            fontFamily: "Montserrat",
            color: Colors.grey.shade500,
            fontWeight: FontWeight.w400,
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: 30,
          fontFamily: "Montserrat",
          color: Colors.grey.shade500,
          fontWeight: FontWeight.w400,
        ),
        controller: _contentController,
      ),
    );
  }

  Container buildTitleContainer() {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.05,
      width: size.width * 0.8,
      child: TextField(
        decoration: InputDecoration(
          hintText: "Title",
          hintStyle: TextStyle(
            fontSize: 40,
            fontFamily: "Montserrat",
            color: Colors.grey.shade500,
            fontWeight: FontWeight.w600,
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 40,
          fontFamily: "Montserrat",
          color: Colors.grey.shade500,
          fontWeight: FontWeight.w600,
        ),
        controller: _titleController,
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


