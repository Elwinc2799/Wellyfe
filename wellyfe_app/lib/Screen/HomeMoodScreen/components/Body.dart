import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wellyfe_app/Screen/HomeMoodScreen/components/Background.dart';

class Body extends StatelessWidget {

  String getMonth(int i) {
    switch (i) {
      case 1:
        return "JAN";
      case 2:
        return "FEB";
      case 3:
        return "MAR";
      case 4:
        return "APR";
      case 5:
        return "MAY";
      case 6:
        return "JUN";
      case 7:
        return "JUL";
      case 8:
        return "AUG";
      case 9:
        return "SEP";
      case 10:
        return "DEC";
      case 11:
        return "NOV";
      case 12:
        return "DEC";
    }

    return "";
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      children: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                DateFormat('y').format(DateTime.now()),
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Montserrat",
                  color: Color(0XFF394D70),
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Container(
                height: size.height * 0.35,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: Color(0XFFF2F3F7),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Text(
                        "The day you joined us: August 2021",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Montserrat",
                          color: Color(0XFF394D70),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: size.height * 0.025),
                      for (var days = 0; days < 31; days++)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            for (var j = 0; j < 5; j++)
                              Container(
                                height: 10,
                                width: 10,
                                color: Colors.blue,
                              ),
                          ],
                        ),
                    ],
                  ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

