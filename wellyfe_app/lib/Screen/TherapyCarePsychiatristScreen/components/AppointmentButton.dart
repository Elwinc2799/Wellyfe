import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppointmentButton extends StatelessWidget {
  const AppointmentButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () async {
        String url = 'https://wa.me/601139022271';
        await launch(url);
        },
      child: Container(
        height: size.height * 0.05,
        width: size.width * 0.525,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            color: Color(0XFF72CCD4),
            boxShadow: [
              BoxShadow(
                  blurRadius: 5.0,
                  offset: Offset(-3, -3),
                  color: Colors.white
              ),
              BoxShadow(
                  blurRadius: 5.0,
                  offset: Offset(3, 3),
                  color: Colors.black.withOpacity(.25)
              )
            ]
        ),
        child: Center(
          child: Text(
            "Make An Appointment",
            style: TextStyle(
              fontSize: 16,
              fontFamily: "NunitoSans",
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}