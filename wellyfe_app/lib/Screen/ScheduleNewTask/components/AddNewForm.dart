import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:wellyfe_app/Core/Model/Task.dart';
import 'package:wellyfe_app/Screen/ScheduleNewTask/components/AddTaskButton.dart';
import 'package:wellyfe_app/Screen/ScheduleNewTask/components/TextFieldLabel.dart';

class AddNewForm extends StatefulWidget {
  @override
  _AddNewFormState createState() => _AddNewFormState();
}

class _AddNewFormState extends State<AddNewForm> {

  final _taskTitleController = TextEditingController();
  TextEditingController _taskDateController = TextEditingController();
  var firebaseUser =  FirebaseAuth.instance.currentUser;
  final firestoreInstance = FirebaseFirestore.instance;

  Future<void> addNewTask(String title, String priority, DateTime date, int startTime, int endTime) async {
    int taskPriorityInt = taskPriority(priority);

    DocumentReference documentReference = await firestoreInstance
        .collection("tasks")
        .doc(firebaseUser!.uid)
        .collection("task")
        .add({
        "taskName": title,
        "taskPriority": taskPriorityInt,
        "taskCategory": "Pending",
        "dueDate": date,
        "startTime": startTime,
        "endTime": endTime,
        "isDone": false,
      });

    Task.taskDataList.add(
        Task(
          documentReference.id,
          _taskTitleController.text,
          taskPriority(priorityValue),
          "Pending",
          DateTime.parse(_taskDateController.text),
          int.parse(startTimeValue.substring(0, 1)),
          int.parse(endTimeValue.substring(0, 1)),
          false,
        )
    );

    showNotification("New task added.");
  }

  ToastFuture showNotification(String content) {
    return showToast(
      content,
      context: context,
      animation: StyledToastAnimation.fade,
      reverseAnimation: StyledToastAnimation.fade,
      duration: Duration(seconds: 3),
      position: StyledToastPosition.center,
    );
  }

  int taskPriority(String priority) {
    if (priority == "Low")
      return 1;
    else if (priority == "Medium")
      return 2;
    return 3;
  }

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
          ),
          SizedBox(height: size.height * 0.075),
          AddTaskButton(
            function: () {
              addNewTask(
                _taskTitleController.text,
                priorityValue,
                DateTime.parse(_taskDateController.text),
                int.parse(startTimeValue.substring(0, 1)),
                int.parse(endTimeValue.substring(0, 1))
              );
            },
          ),
        ],
      ),
    );
  }

  Container buildStartTimeForm() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.width * 0.11,
      decoration: buildNeumorphicTextField(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: DropdownButton<String>(
          underline: Container(
            height: 2,
            color: Colors.transparent,
          ),
          value: startTimeValue,
          icon: Icon(Icons.arrow_drop_down_rounded),
          style: TextStyle(
            fontFamily: "NunitoSans",
            fontSize: 15,
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
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.width * 0.11,
      decoration: buildNeumorphicTextField(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: DropdownButton<String>(
          underline: Container(
            height: 2,
            color: Colors.transparent,
          ),
          value: endTimeValue,
          icon: Icon(Icons.arrow_drop_down_rounded),
          style: TextStyle(
            fontFamily: "NunitoSans",
            fontSize: 15,
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
        width: MediaQuery.of(context).size.width * 0.55,
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
                  fontSize: 25,
                  fontFamily: "Nunito",
                  color: Color(0XFFB1BDD3),
                ),
                textStyleYearButton: TextStyle(
                  fontSize: 25,
                  fontFamily: "Nunito",
                  color: Color(0XFFB1BDD3),
                ),
                textStyleDayHeader: TextStyle(
                  fontSize: 25,
                  fontFamily: "Nunito",
                  color: Color(0XFFB1BDD3),
                ),
                textStyleCurrentDayOnCalendar: TextStyle(
                  fontSize: 25,
                  fontFamily: "Nunito",
                  color: Color(0XFFB1BDD3),
                  fontWeight: FontWeight.bold,
                ),
                textStyleDayOnCalendar: TextStyle(
                  fontSize: 25,
                  fontFamily: "Nunito",
                  color: Colors.black45,
                ),
                textStyleDayOnCalendarSelected: TextStyle(
                  fontSize: 25,
                  fontFamily: "Nunito",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textStyleMonthYearHeader: TextStyle(
                  fontSize: 25,
                  fontFamily: "Nunito",
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                ),
                textStyleDayOnCalendarDisabled: TextStyle(
                  fontSize: 25,
                  fontFamily: "Nunito",
                  color: Color(0XFFB1BDD3).withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                ),
                paddingDatePicker: EdgeInsets.all(0),
                paddingMonthHeader: EdgeInsets.all(28),
                paddingActionBar: EdgeInsets.all(13),
                paddingDateYearHeader: EdgeInsets.all(28),
                sizeArrow: 40,
                colorArrowNext: Color(0XFFB1BDD3),
                colorArrowPrevious: Color(0XFFB1BDD3),
                marginLeftArrowPrevious: 13,
                marginTopArrowPrevious: 13,
                marginTopArrowNext: 13,
                marginRightArrowNext: 28,
                textStyleButtonAction: TextStyle(fontSize: 28, color: Color(0XFFB1BDD3)),
                textStyleButtonPositive:
                TextStyle(fontSize: 28, color: Color(0XFFB1BDD3), fontWeight: FontWeight.bold),
                textStyleButtonNegative: TextStyle(fontSize: 28, color: Color(0XFFB1BDD3).withOpacity(0.5)),
                decorationDateSelected: BoxDecoration(color: Color(0XFF5DAA96), borderRadius: BorderRadius.circular(30.0)),
                backgroundPicker: Color(0XFFE4EDFF),
                backgroundActionBar: Color(0XFFE4EDFF),
                backgroundHeaderMonth: Color(0XFFE4EDFF),
              ),
              styleYearPicker: MaterialRoundedYearPickerStyle(
                textStyleYear: TextStyle(fontSize: 35, color: Colors.white),
                textStyleYearSelected:
                TextStyle(fontSize: 45, color: Colors.white, fontWeight: FontWeight.bold),
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
            hintStyle: TextStyle(fontFamily: "NunitoSans", fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black.withOpacity(.5)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            enabledBorder: outlineBorder(),
            focusedBorder: outlineBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          style: TextStyle(
            fontFamily: "NunitoSans",
            fontSize: 15,
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
      width: MediaQuery.of(context).size.width * 0.32,
      height: MediaQuery.of(context).size.width * 0.11,
      decoration: buildNeumorphicTextField(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: DropdownButton<String>(
          underline: Container(
            height: 2,
            color: Colors.transparent,
          ),
          value: priorityValue,
          icon: Icon(Icons.arrow_drop_down_rounded),
          style: TextStyle(
            fontFamily: "NunitoSans",
            fontSize: 15,
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
      height: MediaQuery.of(context).size.width * 0.11,
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: buildNeumorphicTextField(),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Enter the title",
          hintStyle: TextStyle(fontFamily: "NunitoSans", fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black.withOpacity(.5)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: outlineBorder(),
          focusedBorder: outlineBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        style: TextStyle(
          fontFamily: "NunitoSans",
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: Colors.black.withOpacity(.5),
        ),
        controller: _taskTitleController,
      ),
    );
  }

  BoxDecoration buildNeumorphicTextField() {
    return BoxDecoration(
      color: Color(0XFFE5EBF2),
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
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
