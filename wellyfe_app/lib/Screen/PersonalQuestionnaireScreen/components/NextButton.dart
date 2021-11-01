import 'package:flutter/material.dart';
import 'package:wellyfe_app/constants.dart';

class NextButton extends StatelessWidget {

  const NextButton({
    Key? key,
    required this.function,
}) : super(key: key);

  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: function,
      child: Container(
        height: size.height * 0.05,
        width: size.width * 0.25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: backgroundColor,
            boxShadow: [
              BoxShadow(
                  blurRadius: 2.0,
                  offset: Offset(-3, -3),
                  color: Colors.white
              ),
              BoxShadow(
                  blurRadius: 2.0,
                  offset: Offset(3, 3),
                  color: Colors.black.withOpacity(.15)
              )
            ]
        ),
        child: Center(
          child: Text(
            "Next",
            style: TextStyle(
                fontSize: 17.5,
                fontFamily: "NunitoSans",
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(.5)
            ),
          ),
        ),
      ),
    );
  }
}