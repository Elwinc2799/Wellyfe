import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TopLevelBar extends StatelessWidget {
  const TopLevelBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          DateFormat('EEEE, d MMMM').format(DateTime.now()),
          style: TextStyle(
            fontSize: 22.5,
            fontFamily: "NunitoSans",
            color: Color(0XFF394D70),
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class TopLevelIcon extends StatelessWidget {
  const TopLevelIcon({
    Key? key,
    required this.function,
    required this.image,
  }) : super(key: key);

  final VoidCallback function;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Color(0XFFF4F9FF),
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
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
        child: Image(image: AssetImage(image)),
      ),
    );
  }
}