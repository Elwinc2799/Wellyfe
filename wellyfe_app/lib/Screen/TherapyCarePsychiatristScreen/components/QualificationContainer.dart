import 'package:flutter/material.dart';

class QualificationContainer extends StatelessWidget {
  const QualificationContainer({
    Key? key,
    required this.data,
    required this.qualification,
    required this.color,
  }) : super(key: key);

  final String data;
  final String qualification;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 105,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            data,
            style: TextStyle(
              fontSize: 17.5,
              fontFamily: "NunitoSans",
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            qualification,
            style: TextStyle(
              fontSize: 15,
              fontFamily: "NunitoSans",
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}