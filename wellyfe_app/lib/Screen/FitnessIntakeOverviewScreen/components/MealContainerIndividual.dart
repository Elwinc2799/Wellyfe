import 'package:flutter/material.dart';

class MealContainerIndividual extends StatelessWidget {
  const MealContainerIndividual({
    Key? key,
    required this.meal,
    required this.calorie,
    required this.function,
    required this.isLeft,
    required this.isRight,
  }) : super(key: key);

  final String meal;
  final String calorie;
  final VoidCallback function;
  final bool isLeft;
  final bool isRight;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: function,
      child: Container(
        height: size.height * 0.225,
        width: size.width * 0.275,
        decoration: BoxDecoration(
            color: Color(0XFFF4F9FF),
            borderRadius: BorderRadius.only(
              topLeft: isLeft ? Radius.circular(100.0) : Radius.circular(20.0),
              topRight: isRight ? Radius.circular(100.0) : Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
            boxShadow: [
              BoxShadow(
                  blurRadius: 5.0,
                  offset: Offset(-3, -3),
                  color: Colors.grey.withOpacity(0.1)
              ),
              BoxShadow(
                  blurRadius: 5.0,
                  offset: Offset(3, 3),
                  color: Colors.black.withOpacity(.25)
              )
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                meal,
                style: TextStyle(
                  fontSize: 27.5,
                  fontFamily: "NunitoSans",
                  color: Colors.black.withOpacity(0.3),
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    calorie,
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: "NunitoSans",
                      color: Color(0XFF394D70),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: size.width * 0.025),
                  Text(
                    "kcal",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "NunitoSans",
                      color: Colors.black.withOpacity(0.3),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Text(
                "+ Snacks",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "NunitoSans",
                  color: Colors.black.withOpacity(0.3),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}