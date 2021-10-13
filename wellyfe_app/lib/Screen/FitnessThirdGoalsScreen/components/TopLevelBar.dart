import 'package:flutter/material.dart';

class TopLevelBar extends StatelessWidget {
  const TopLevelBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "P R E F E R E N C E S",
          style: TextStyle(
            fontSize: 22.5,
            fontFamily: "NunitoSans",
            color: Color(0XFF394D70),
            fontWeight: FontWeight.w700,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0XFFF4F9FF),
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
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: Color(0XFF394D70),
              )
          ),
        )
      ],
    );
  }
}
