import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:wellyfe_app/Screen/ScheduleNewTask/components/TextFieldLabel.dart';

class AddNewForm extends StatefulWidget {
  @override
  _AddNewFormState createState() => _AddNewFormState();
}

class _AddNewFormState extends State<AddNewForm> {
  String dropdownValue = "Low";
  String startTime = "6 AM";
  String endTime = "7 AM";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldLabel(label: "Title"),
          buildTitleForm(),
          SizedBox(height: size.height * 0.025),
          TextFieldLabel(label: "Priority"),
          buildPriorityForm(),
          SizedBox(height: size.height * 0.025),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldLabel(label: "Start time"),
                  buildStartTimeForm(),
                ],
              ),
              SizedBox(width: size.width * 0.1),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldLabel(label: "End time"),
                  buildEndTimeForm(),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Container buildStartTimeForm() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.275,
      height: MediaQuery.of(context).size.width * 0.11,
      decoration: buildNeumorphicTextField(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: DropdownButton<String>(
          underline: Container(
            height: 2,
            color: Colors.transparent,
          ),
          value: startTime,
          icon: Icon(Icons.arrow_drop_down_rounded),
          style: TextStyle(
            fontFamily: "NunitoSans",
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black.withOpacity(.5),
          ),
          onChanged: (String? newValue) {
            setState(() {
              startTime = newValue!;
            });
          },
          items: <String>["6 AM", "7 AM", "8 AM", "9 AM", "10 AM", "11 AM", "12 PM", "1 PM", "2 PM", "3 PM", "4 PM", "5 PM", "6 PM", "7 PM", "8 PM", "9 PM", "10 PM"]
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  Container buildEndTimeForm() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.275,
      height: MediaQuery.of(context).size.width * 0.11,
      decoration: buildNeumorphicTextField(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: DropdownButton<String>(
          underline: Container(
            height: 2,
            color: Colors.transparent,
          ),
          value: endTime,
          icon: Icon(Icons.arrow_drop_down_rounded),
          style: TextStyle(
            fontFamily: "NunitoSans",
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black.withOpacity(.5),
          ),
          onChanged: (String? newValue) {
            setState(() {
              endTime = newValue!;
            });
          },
          items: <String>["7 AM", "8 AM", "9 AM", "10 AM", "11 AM", "12 PM", "1 PM", "2 PM", "3 PM", "4 PM", "5 PM", "6 PM", "7 PM", "8 PM", "9 PM", "10 PM"]
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  Container buildPriorityForm() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.275,
      height: MediaQuery.of(context).size.width * 0.11,
      decoration: buildNeumorphicTextField(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: DropdownButton<String>(
          underline: Container(
            height: 2,
            color: Colors.transparent,
          ),
          value: dropdownValue,
          icon: Icon(Icons.arrow_drop_down_rounded),
          style: TextStyle(
            fontFamily: "NunitoSans",
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black.withOpacity(.5),
          ),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>["Low", "Medium", "High"]
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  Container buildTitleForm() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: buildNeumorphicTextField(),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Enter the title",
          hintStyle: TextStyle(fontFamily: "NunitoSans", fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black.withOpacity(.5)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: outlineBorder(),
          focusedBorder: outlineBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: NeumorphicIcon(Icons.bubble_chart, size: 40),
          ),
        ),
        style: TextStyle(
          fontFamily: "NunitoSans",
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.black.withOpacity(.5),
        ),
      ),
    );
  }

  BoxDecoration buildNeumorphicTextField() {
    return BoxDecoration(
        color: Color(0XFFE4EDFF),
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
}

OutlineInputBorder outlineBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: Color(0XFFE4EDFF)),
    gapPadding: 10,
  );
}
