import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wellyfe_app/Core/Model/Appointment.dart';
import 'package:wellyfe_app/Core/Model/Doctor.dart';
import 'package:wellyfe_app/Screen/TherapyCareOverviewScreen/components/AppointmentContainer.dart';
import 'package:wellyfe_app/Screen/TherapyCareOverviewScreen/components/AppointmentHeader.dart';
import 'package:wellyfe_app/Screen/TherapyCareOverviewScreen/components/SpecialistRecommendationContainer.dart';
import 'package:wellyfe_app/Screen/TherapyCareOverviewScreen/components/TherapyShortcut.dart';
import 'package:wellyfe_app/Screen/TherapyCareOverviewScreen/components/TopLevelBar.dart';
import 'package:wellyfe_app/Screen/TherapyCareOverviewScreen/components/Background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Appointment nextAppointment = Appointment.getNextAppointment();
    Doctor appointmentDoctor = Doctor.getDoctor(nextAppointment.doctorID);

    return Background(
      children: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopLevelBar(),
          SizedBox(height: size.height * 0.01),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              "Find your desired doctor.",
              style: TextStyle(
                fontSize: 35,
                fontFamily: "NunitoSans",
                color: Color(0XFF394D70),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          TherapyShortcut(),
          SizedBox(height: size.height * 0.02),
          AppointmentHeader(),
          SizedBox(height: size.height * 0.025),
          AppointmentContainer(
            therapy: appointmentDoctor.specialisedTherapy + " Therapy",
            name: "Dr. " + appointmentDoctor.name,
            date: DateFormat('d MMMM').format(nextAppointment.appointmentDate),
            time: nextAppointment.appointmentTime,
          ),
          SizedBox(height: size.height * 0.075),
          SpecialistRecommendationContainer(),
        ],
      ),
    );
  }
}








