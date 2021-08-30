import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:wellyfe_app/Core/Model/Questionnaire.dart';

class SelectionButton extends StatefulWidget {
  const SelectionButton({Key? key, required this.question}) : super(key: key);

  @override
  _SelectionButtonState createState() => _SelectionButtonState();

  final int question;
}

class _SelectionButtonState extends State<SelectionButton> {
  String groupValue = "";
  List<String> category = [
    "Highly Disagree", "Disagree", "Neutral", "Agree", "Highly Agree"
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      children:
      List.generate(category.length, (index) {
        return Row(
          children: [
            NeumorphicRadio(
              value: category[index],
              groupValue: groupValue,
              onChanged: (dynamic value) {
                setState(() {
                  groupValue = value;
                });
                Questionnaire.agreeableListAns[widget.question] = index + 1;
              },
              style: NeumorphicRadioStyle(
                selectedColor: Color(0XFFDBE6E8),
                selectedDepth: -5,
                unselectedColor: Color(0XFFDBE6E8),
                unselectedDepth: 10,
              ),
              child: Container(
                height: size.height * 0.075,
                width: size.width * 0.15,
                child: Center(
                  child: Text(
                    category[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: "NunitoSans",
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(.5)
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: size.width * 0.025),
          ],
        );
      })
      ,
    );
  }
}
