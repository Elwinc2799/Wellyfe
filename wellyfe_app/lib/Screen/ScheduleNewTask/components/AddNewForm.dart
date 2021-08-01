import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:wellyfe_app/Screen/ScheduleNewTask/components/TextFieldLabel.dart';

class AddNewForm extends StatefulWidget {
  @override
  _AddNewFormState createState() => _AddNewFormState();
}

class _AddNewFormState extends State<AddNewForm> {

  final _taskTitleController = TextEditingController();
  TextEditingController _taskDateController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  String priorityValue = "Low";
  String startTimeValue = "6 AM";
  String endTimeValue = "7 AM";

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
          TextFieldLabel(label: "Date"),
          buildDateForm(),
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
          value: startTimeValue,
          icon: Icon(Icons.arrow_drop_down_rounded),
          style: TextStyle(
            fontFamily: "NunitoSans",
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black.withOpacity(.5),
          ),
          onChanged: (String? newValue) {
            setState(() {
              startTimeValue = newValue!;
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
          value: endTimeValue,
          icon: Icon(Icons.arrow_drop_down_rounded),
          style: TextStyle(
            fontFamily: "NunitoSans",
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black.withOpacity(.5),
          ),
          onChanged: (String? newValue) {
            setState(() {
              endTimeValue = newValue!;
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

  GestureDetector buildDateForm() {
    return GestureDetector(
      // onTap: _selectDate(context),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        height: MediaQuery.of(context).size.width * 0.11,
        decoration: buildNeumorphicTextField(),
        child: TextFormField(
          onTap: () async {
            FocusScope.of(context).requestFocus(new FocusNode());

            DateTime? newSelectedDate = await showRoundedDatePicker(
              context: context,
              theme: ThemeData(primaryColor: Color(0XFFE4EDFF)),
              styleDatePicker: MaterialRoundedDatePickerStyle(
                textStyleDayButton: TextStyle(
                  fontSize: 30,
                  fontFamily: "Nunito",
                  color: Color(0XFFB1BDD3),
                ),
                textStyleYearButton: TextStyle(
                  fontSize: 30,
                  fontFamily: "Nunito",
                  color: Color(0XFFB1BDD3),
                ),
                textStyleDayHeader: TextStyle(
                  fontSize: 30,
                  fontFamily: "Nunito",
                  color: Color(0XFFB1BDD3),
                ),
                textStyleCurrentDayOnCalendar: TextStyle(
                  fontSize: 30,
                  fontFamily: "Nunito",
                  color: Color(0XFFB1BDD3),
                  fontWeight: FontWeight.bold,
                ),
                textStyleDayOnCalendar: TextStyle(
                  fontSize: 30,
                  fontFamily: "Nunito",
                  color: Color(0XFFB1BDD3),
                ),
                textStyleDayOnCalendarSelected: TextStyle(
                  fontSize: 30,
                  fontFamily: "Nunito",
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                ),
                textStyleMonthYearHeader: TextStyle(
                  fontSize: 30,
                  fontFamily: "Nunito",
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                ),
                textStyleDayOnCalendarDisabled: TextStyle(
                  fontSize: 30,
                  fontFamily: "Nunito",
                  color: Color(0XFFB1BDD3).withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                ),
                paddingDatePicker: EdgeInsets.all(0),
                paddingMonthHeader: EdgeInsets.all(32),
                paddingActionBar: EdgeInsets.all(16),
                paddingDateYearHeader: EdgeInsets.all(32),
                sizeArrow: 50,
                colorArrowNext: Color(0XFFB1BDD3),
                colorArrowPrevious: Color(0XFFB1BDD3),
                marginLeftArrowPrevious: 16,
                marginTopArrowPrevious: 16,
                marginTopArrowNext: 16,
                marginRightArrowNext: 32,
                textStyleButtonAction: TextStyle(fontSize: 28, color: Color(0XFFB1BDD3)),
                textStyleButtonPositive:
                TextStyle(fontSize: 28, color: Color(0XFFB1BDD3), fontWeight: FontWeight.bold),
                textStyleButtonNegative: TextStyle(fontSize: 28, color: Color(0XFFB1BDD3).withOpacity(0.5)),
                decorationDateSelected: BoxDecoration(color: Colors.pink[100], shape: BoxShape.circle),
                backgroundPicker: Color(0XFFE4EDFF),
                backgroundActionBar: Color(0XFFE4EDFF),
                backgroundHeaderMonth: Color(0XFFE4EDFF),
              ),
              styleYearPicker: MaterialRoundedYearPickerStyle(
                textStyleYear: TextStyle(fontSize: 40, color: Colors.white),
                textStyleYearSelected:
                TextStyle(fontSize: 56, color: Colors.white, fontWeight: FontWeight.bold),
                heightYearRow: 100,
                backgroundPicker: Colors.deepPurple[400],
              ),
              listDateDisabled: [
              ],
              onTapDay: (DateTime dateTime, bool available) {
                if (!available) {
                  showDialog(
                    context: context,
                    builder: (c) => CupertinoAlertDialog(
                      title: Text("This date cannot be selected."),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          child: Text("OK"),
                          onPressed: () {
                            Navigator.pop(context);
                          }
                        )
                      ],
                    )
                  );
                }
                return available;
              }
            );

            _taskDateController.value = TextEditingValue(text: newSelectedDate.toString().substring(0, 10));
          },
          decoration: InputDecoration(
            hintText: "Enter the date",
            hintStyle: TextStyle(fontFamily: "NunitoSans", fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black.withOpacity(.5)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            enabledBorder: outlineBorder(),
            focusedBorder: outlineBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: NeumorphicIcon(Icons.access_time_outlined, size: 40),
            ),
          ),
          style: TextStyle(
            fontFamily: "NunitoSans",
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black.withOpacity(.5),
          ),
          controller: _taskDateController,
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
          value: priorityValue,
          icon: Icon(Icons.arrow_drop_down_rounded),
          style: TextStyle(
            fontFamily: "NunitoSans",
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black.withOpacity(.5),
          ),
          onChanged: (String? newValue) {
            setState(() {
              priorityValue = newValue!;
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
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: NeumorphicIcon(Icons.bubble_chart, size: 40),
          ),
        ),
        style: TextStyle(
          fontFamily: "NunitoSans",
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.black.withOpacity(.5),
        ),
        controller: _taskTitleController,
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
