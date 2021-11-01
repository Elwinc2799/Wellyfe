import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:wellyfe_app/Screen/PersonalQuestionnaireScreen/components/NextButton.dart';
import 'package:wellyfe_app/Screen/SignInScreen/components/TextFieldLabel.dart';
import 'package:wellyfe_app/constants.dart';
import 'package:wellyfe_app/Screen/PersonalityQuestionnaireScreen/ExtroversionPersonalityScreen/ExtroversionPersonalityScreen.dart';

class QuestionnaireForm extends StatefulWidget {
  @override
  _QuestionnaireFormState createState() => _QuestionnaireFormState();
}

class _QuestionnaireFormState extends State<QuestionnaireForm> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  String _genderValue = "Male";
  var firebaseUser =  FirebaseAuth.instance.currentUser;
  final firestoreInstance = FirebaseFirestore.instance;

  Future<void> addNewUser(String name, String age, String gender) async {

    firestoreInstance
        .collection("users")
        .doc(firebaseUser!.uid)
        .collection("user")
        .add({
          "name": name,
          "imageUrl": "None",
          "personality": "None",
          "age": age,
          "gender": gender,
    });

    // Provider.of<DiaryProvider>(context, listen: false).addNewDiary(
    //     Diary(
    //       documentReference.id,
    //       title,
    //       content,
    //       mood,
    //       weather,
    //       Diary.newImageUrl,
    //       favourite,
    //       DateTime.now(),
    //     )
    // );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldLabel(label: "Name"),
            buildNameFormField(),
            SizedBox(height: size.height * 0.035),
            TextFieldLabel(label: "Age"),
            buildAgeFormField(),
            SizedBox(height: size.height * 0.035),
            TextFieldLabel(label: "Gender"),
            buildGenderFormField(),
            SizedBox(height: size.height * 0.075),
            NextButton(
              function: () {
                addNewUser(
                    _nameController.text,
                    _ageController.text,
                    _genderValue);
                Navigator.push(context, PageTransition(
                  type: PageTransitionType.fade,
                  child: ExtroversionPersonalityScreen(),
                ));
                },
            )
          ],
        ),
    );
  }

  Container buildNameFormField() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height * 0.075,
      decoration: buildNeumorphicTextField(),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Enter your name",
          hintStyle: TextStyle(fontFamily: "NunitoSans", fontSize: 17.5, fontWeight: FontWeight.w700, color: Colors.black.withOpacity(.5)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: outlineBorder(),
          focusedBorder: outlineBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.person, size: 30),
          ),
        ),
        style: TextStyle(
          fontFamily: "NunitoSans",
          fontSize: 17.5,
          fontWeight: FontWeight.w700,
          color: Colors.black.withOpacity(.5),
        ),
        controller: _nameController,
      ),
    );
  }

  Container buildAgeFormField() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.55,
      height: MediaQuery.of(context).size.height * 0.075,
      decoration: buildNeumorphicTextField(),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Enter your age",
          hintStyle: TextStyle(fontFamily: "NunitoSans", fontSize: 17.5, fontWeight: FontWeight.w700, color: Colors.black.withOpacity(.5)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: outlineBorder(),
          focusedBorder: outlineBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.bubble_chart_rounded, size: 30),
          ),
        ),
        style: TextStyle(
          fontFamily: "NunitoSans",
          fontSize: 17.5,
          fontWeight: FontWeight.w700,
          color: Colors.black.withOpacity(.5),
        ),
        controller: _ageController,
      ),
    );
  }

  Container buildGenderFormField() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.075,
      decoration: buildNeumorphicTextField(),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
        child: DropdownButton<String>(
          underline: Container(
            height: 0.75,
            color: Colors.transparent,
          ),
          value: _genderValue,
          icon: Icon(Icons.arrow_drop_down_rounded),
          style: TextStyle(
            fontFamily: "NunitoSans",
            fontSize: 17.5,
            fontWeight: FontWeight.w700,
            color: Colors.black.withOpacity(.5),
          ),
          onChanged: (String? newValue) {
            setState(() {
              _genderValue = newValue!;
            });
          },
          items: <String>["Male", "Female"].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  BoxDecoration buildNeumorphicTextField() {
    return BoxDecoration(
        color: Color(0xFFE6EBF2),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        boxShadow: [
          BoxShadow(
              blurRadius: 5.0,
              offset: Offset(-3, -3),
              color: Colors.white.withOpacity(.7)
          ),
          BoxShadow(
              blurRadius: 5.0,
              offset: Offset(3, 3),
              color: Colors.black.withOpacity(.15)
          )
        ]
    );
  }

  OutlineInputBorder outlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: BorderSide(color: backgroundColor),
      gapPadding: 7.5,
    );
  }
}
