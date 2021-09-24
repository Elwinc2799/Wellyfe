import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadioItem extends StatelessWidget {
  const RadioItem({
    Key? key,
    required this.text,
    required this.isSelected
  }) : super(key: key);

  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            height: size.height * 0.075,
            width: size.width * 0.1,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: isSelected ? Colors.white : Color(0XFF344460),
                  fontSize: 22.5,
                  fontFamily: "NunitoSans",
                  fontWeight: FontWeight.w700,
                )
              ),
            ),
            decoration: BoxDecoration(
              color: isSelected ? Colors.blueAccent : Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
          ),
        ],
      ),
    );
  }
}