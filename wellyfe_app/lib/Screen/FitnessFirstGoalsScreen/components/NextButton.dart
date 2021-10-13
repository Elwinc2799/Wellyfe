import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {

  final VoidCallback function;

  const NextButton({Key? key, required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: function,
      child: Container(
        width: size.height * 0.125,
        height: size.width * 0.1,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
        child: Center(
          child: Text(
            "Next",
            style: TextStyle(
              fontSize: 20,
              fontFamily: "NunitoSans",
              color: Color(0XFF394D70),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
