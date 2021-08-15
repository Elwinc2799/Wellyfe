import 'package:flutter/material.dart';

class TopLevelBar extends StatelessWidget {
  const TopLevelBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0XFFEBECF0),
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
                child: Image(image: AssetImage("assets/logo/menu.png"))
            )
        ),
      ],
    );
  }
}