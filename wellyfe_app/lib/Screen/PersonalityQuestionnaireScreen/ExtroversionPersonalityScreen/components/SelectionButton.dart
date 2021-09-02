import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:wellyfe_app/Core/Model/Questionnaire.dart';
import 'package:wellyfe_app/Core/Model/RadioModel.dart';
import 'package:wellyfe_app/Screen/PersonalityQuestionnaireScreen/RadioItem.dart';

class SelectionButton extends StatefulWidget {
  const SelectionButton({Key? key, required this.question}) : super(key: key);

  @override
  _SelectionButtonState createState() => _SelectionButtonState();

  final int question;
}

class _SelectionButtonState extends State<SelectionButton> {
  List<RadioModel> sampleData = [
    RadioModel("Highly Disagree", false),
    RadioModel("Disagree", false),
    RadioModel("Neutral", false),
    RadioModel("Agree", false),
    RadioModel("Highly Agree", false),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          children:
            List.generate(sampleData.length, (index) {
              return Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sampleData.forEach((element) => element.isSelected = false);
                        sampleData[index].isSelected = true;
                      });

                      Questionnaire.extroversionListAns[widget.question] = index + 1;
                    },
                    child: new RadioItem(sampleData[index]),
                  ),
                  SizedBox(width: size.width * 0.025),
                ],
              );
            })
          ,
        ),
      ),
    );
  }
}
