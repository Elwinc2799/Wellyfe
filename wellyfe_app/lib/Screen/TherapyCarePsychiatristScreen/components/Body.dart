import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellyfe_app/Core/Model/Doctor.dart';
import 'package:wellyfe_app/Screen/TherapyCarePsychiatristScreen/components/AppointmentButton.dart';
import 'package:wellyfe_app/Screen/TherapyCarePsychiatristScreen/components/DoctorLowContainer.dart';
import 'package:wellyfe_app/Screen/TherapyCarePsychiatristScreen/components/DoctorProfileInfo.dart';
import 'package:wellyfe_app/Screen/TherapyCarePsychiatristScreen/components/TopLevelBar.dart';
import 'package:wellyfe_app/Screen/TherapyCarePsychiatristScreen/components/Background.dart';

class Body extends StatefulWidget {
  final Doctor doctor;
  final String imageUrl;

  const Body({
    Key? key,
    required this.doctor,
    required this.imageUrl,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  DatePickerController controller = DatePickerController();
  DateTime selectedValue = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
        children: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(17.5, 75.0, 17.5, 0.0),
                child: TopLevelBar(),
              ),
              Container(
                height: size.height * 0.725,
                width: size.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 0,
                      child: Image(
                        image: AssetImage(widget.imageUrl),
                        height: size.height * 0.35,
                        width: size.width * 0.80,
                      ),
                    ),
                    DoctorLowContainer(
                      doctor: widget.doctor,
                    ),
                    DoctorProfileInfo(
                      name: widget.doctor.name,
                      university: widget.doctor.graduateUniversity,
                    ),
                  ],
                ),
              ),
              buildDatePicker(),
              SizedBox(height: size.height * 0.025),
              AppointmentButton(),
              SizedBox(height: size.height * 0.075),
            ],
          ),
        ),
    );
  }

  DatePicker buildDatePicker() {
    Size size = MediaQuery.of(context).size;

    return DatePicker(
      DateTime.now(),
      width: size.width * 0.15,
      height: size.height * 0.105,
      controller: controller,
      initialSelectedDate: DateTime.now(),
      selectionColor: Colors.black,
      selectedTextColor: Colors.white,
      monthTextStyle: TextStyle(
        fontSize: 12,
        fontFamily: "NunitoSans",
        color: Color(0XFF394D70),
        fontWeight: FontWeight.w700,
      ),
      dayTextStyle: TextStyle(
        fontSize: 12,
        fontFamily: "NunitoSans",
        color: Color(0XFF394D70),
        fontWeight: FontWeight.w700,
      ),
      dateTextStyle: TextStyle(
        fontSize: 20,
        fontFamily: "NunitoSans",
        color: Color(0XFF394D70),
        fontWeight: FontWeight.w700,
      ),
      deactivatedColor: Colors.grey.shade800,
      inactiveDates: [
        DateTime.now().add(Duration(days: 3)),
        DateTime.now().add(Duration(days: 4)),
        DateTime.now().add(Duration(days: 7))
      ],
      onDateChange: (date) {
        setState(() {
          selectedValue = date;
        });
      },
    );
  }
}






