import 'package:flutter/material.dart';

class TopLevelBar extends StatelessWidget {
  const TopLevelBar({
    Key? key,
    required this.month,
  }) : super(key: key);

  final String month;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            month + " / 2021",
            style: TextStyle(
              fontSize: 22.5,
              fontFamily: "Montserrat",
              color: Color(0XFF394D70),
              fontWeight: FontWeight.w600,
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
                            color: Colors.white.withOpacity(0.25)
                        ),
                        BoxShadow(
                            blurRadius: 5.0,
                            offset: Offset(3, 3),
                            color: Colors.black.withOpacity(.25)
                        )
                      ]
                  ),
                  child: Center(
                      child: Image(image: AssetImage("assets/logo/menu.png"), width: 18, height: 18,)
                  )
              )
          )
        ],
      ),
    );
  }
}