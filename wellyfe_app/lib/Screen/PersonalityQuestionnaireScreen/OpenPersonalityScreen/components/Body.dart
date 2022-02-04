import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wellyfe_app/Core/Model/Questionnaire.dart';
import 'package:wellyfe_app/Screen/DailyMoodScreen/DailyMoodScreen.dart';
import 'package:wellyfe_app/Screen/PersonalityQuestionnaireScreen/OpenPersonalityScreen/components/QuestionnaireButton.dart';
import 'package:wellyfe_app/Screen/PersonalityQuestionnaireScreen/OpenPersonalityScreen/components/SelectionButton.dart';
import 'dart:math';
import 'package:tflite/tflite.dart';

import 'package:wellyfe_app/Screen/SignInScreen/SignInScreen.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var firebaseUser =  FirebaseAuth.instance.currentUser;
  final firestoreInstance = FirebaseFirestore.instance;
  bool loading = true;
  var response = " ";

  Future<void> submitPersonality() async {
      var rng = new Random();
      // pickPersonality();
      List<String> personalityList = ["extroversion", "neuroticism", "agreeable", "conscientious", "open minded"];
      String res = personalityList[rng.nextInt(5)];

      firestoreInstance
          .collection("users")
          .doc(firebaseUser!.uid)
          .update({
        "personality": res,
      });


    Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          child: SignInScreen(),
        ),
        ModalRoute.withName('/')
    );
  }

  void runModel(){
    super.initState();

    loadModel().then((value) {
      setState(() {
        loading = false;
      });
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model.tflite",
    );
  }

  pickPersonality() async {
    loading = false;
    var responses = '';
    if (responses == null) return null;
    setState(() {
      loading = true;
      //Declare File _image in the class which is used to display the image on the screen.
      response = responses;
    });
    classifyPersonality(response);
  }

  classifyPersonality(var response) async {
    var output = await Tflite.runModelOnImage(
      path: response,
      numResults: 2,
    );
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 75.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Open Personality",
              style: TextStyle(
                fontSize: 25,
                fontFamily: "NunitoSans",
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(.5)
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              height: size.height * 0.7,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(bottom: 40.0),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(Questionnaire.openList.length, (index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (index + 1).toString() + ". " + Questionnaire.openList[index],
                              style: TextStyle(
                                  fontSize: 17.5,
                                  fontFamily: "NunitoSans",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(.5)
                              ),
                            ),
                            SizedBox(height: size.height * 0.025),
                            SelectionButton(
                              question: index,
                            ),
                            SizedBox(height: size.height * 0.05),
                          ],
                        );
                      }),
                    ),
                    QuestionnaireButton(
                      title: "Done",
                      function: (){submitPersonality();},
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

