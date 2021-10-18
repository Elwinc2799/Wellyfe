import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wellyfe_app/Core/Model/Mood.dart';
import 'package:wellyfe_app/Screen/DailyMoodScreen/components/SliderPainter.dart';
import 'package:wellyfe_app/Screen/DailyMoodScreen/components/TopLevelBar.dart';
import 'package:wellyfe_app/Screen/HomeScreen/HomeScreen.dart';

import 'components/RateButton.dart';

class DailyMoodScreen extends StatefulWidget {

  @override
  State<DailyMoodScreen> createState() => _DailyMoodScreenState();
}

class _DailyMoodScreenState extends State<DailyMoodScreen> {

  var firebaseUser =  FirebaseAuth.instance.currentUser;
  final firestoreInstance = FirebaseFirestore.instance;

  Future<void> addNewMood(String mood) async {
    await firestoreInstance
      .collection("moods")
      .doc(firebaseUser!.uid)
      .collection("mood")
      .add({
        "mood": mood,
        "date": DateTime.now(),
      });

    Mood.moodOfToday = mood;
  }

  double sliderWidth = 380;
  double _dragPercent = 0.0;
  String feel = "0-";
  ValueNotifier<String> mood = ValueNotifier("Awful");
  ValueNotifier<Color> background = ValueNotifier(Color(0XFFD4B2D8));

  @override
  void initState() {
    super.initState();
  }

  void updateDragPosition(Offset offset) {
    setState(() {
      _dragPercent = (offset.dx / sliderWidth).clamp(0.0, 1.0);
    });

    if (_dragPercent >= 0.8)
      setState(() {
        mood.value = "Wonderful";
        background.value = Color(0XFFBCFBE4);
        feel = "75+";
      });
    else if (_dragPercent >= 0.6 && _dragPercent < 0.8)
      setState(() {
        mood.value = "Happy";
        background.value = Color(0XFFF8ECBD);

        if (_dragPercent > 0.7)
          setState(() {
            feel = "75-";
          });
        else
          setState(() {
            feel = "50+";
          });
      });
    else if (_dragPercent >= 0.4 && _dragPercent < 0.6)
      setState(() {
        mood.value = "OK";
        background.value = Color(0XFFFFCDB2);

        if (_dragPercent > 0.5)
          setState(() {
            feel = "50-";
          });
        else
          setState(() {
            feel = "25+";
          });
      });
    else if (_dragPercent >= 0.2 && _dragPercent < 0.4)
      setState(() {
        mood.value = "Sad";
        background.value = Color(0XFFFCBDE9);

        if (_dragPercent > 0.3)
          setState(() {
            feel = "25-";
          });
      });
    else if (_dragPercent < 0.2)
      setState(() {
        mood.value = "Awful";
        background.value = Color(0XFFD4B2D8);

        if (_dragPercent > 0.1)
          setState(() {
            feel = "0+";
          });
        else
          setState(() {
            feel = "0-";
          });
      });
  }

  void _onDragStart(BuildContext context, DragStartDetails details) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    Offset localOffset = renderBox.localToGlobal(details.globalPosition);

    updateDragPosition(localOffset);
  }
  void _onDragUpdate(BuildContext context, DragUpdateDetails details) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    Offset localOffset = renderBox.localToGlobal(details.globalPosition);

    updateDragPosition(localOffset);
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ValueListenableBuilder(
      valueListenable: mood,
      builder: (BuildContext context, String value, Widget? child) {
        return AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          child: Scaffold(
            appBar: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: background.value,
                statusBarIconBrightness: Brightness.dark
              ),
              toolbarHeight: 0,
              toolbarOpacity: 0,
              backgroundColor: background.value,
              elevation: 0,
            ),
            backgroundColor: background.value,
            resizeToAvoidBottomInset: false,
            body: Column(
              children: [
                TopLevelBar(),
                SizedBox(height: size.height * 0.02),
                Text(
                  mood.value,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: "NunitoSans",
                      fontSize: 27.5
                  ),
                ),
                Container(
                  // height: size.height * 0.375,
                  height: size.height * 0.375,
                  width: size.width * 0.8,
                  child: FlareActor(
                    "assets/json/feelings.flr",
                    artboard: "Artboard",
                    fit: BoxFit.fitWidth,
                    animation: feel,
                    // controller: _flareRateController,
                  ),
                ),
                buildSlider(size),
                SizedBox(height: size.height * 0.025),
                RateButton(
                  function: () {
                    addNewMood(mood.value);
                    Navigator.pushReplacement(context, PageTransition(
                        type: PageTransitionType.fade,
                        child: HomeScreen(),
                      ));
                  }
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  buildSlider(Size size) => GestureDetector(
    onHorizontalDragStart: (DragStartDetails details) => _onDragStart(context, details),
    onHorizontalDragUpdate: (DragUpdateDetails details) => _onDragUpdate(context, details),
    child: Container(
      width: size.width * 0.8,
      height: size.height * 0.1,
      child: CustomPaint(
        painter: SliderPainter(progress: _dragPercent),
      ),
    ),
  );
}
