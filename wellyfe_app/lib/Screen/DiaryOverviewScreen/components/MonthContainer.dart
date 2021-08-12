import 'package:flutter/material.dart';

class MonthContainer extends StatelessWidget {
  const MonthContainer({
    Key? key,
    required this.monthString,
    required this.monthNumber,
    required this.datesFilled,
    required this.function,
  }) : super(key: key);

  final String monthString;
  final int monthNumber;
  final int datesFilled;
  final VoidCallback function;

  String getNumberOfDays(int month) {
    DateTime now = DateTime.now();
    int lastDay = DateTime(now.year, monthNumber + 1, 0).day;

    return lastDay.toString();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        GestureDetector(
          onTap: function,
          child: Container(
            height: size.height * 0.45,
            width: size.width * 0.6,
            decoration: BoxDecoration(
                color: Color(0XFFE5EBF2),
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
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        monthNumber.toString(),
                        style: TextStyle(
                          fontSize: 60,
                          fontFamily: "TitilliumWeb",
                          color: Color(0XFF394D70),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        monthString,
                        style: TextStyle(
                          fontSize: 40,
                          fontFamily: "TitilliumWeb",
                          color: Color(0XFF394D70),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: size.width * 0.25,
                            height: size.height * 0.0075,
                            decoration: BoxDecoration(
                              color: Color(0XFFD1D1D1).withOpacity(0.5),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          Container(
                            width: size.width * 0.25 * datesFilled / 31,
                            height: size.height * 0.0075,
                            decoration: BoxDecoration(
                              color: Color(0XFF44BBA4),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        datesFilled.toString() + " / " + getNumberOfDays(monthNumber),
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "TitilliumWeb",
                          color: Color(0XFF394D70),
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: size.width * 0.05,
          top: size.height * 0.025,
          child: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.more_horiz,
              size: 50,
              color: Colors.grey.shade500,
            ),
          ),
        )
      ],
    );
  }
}