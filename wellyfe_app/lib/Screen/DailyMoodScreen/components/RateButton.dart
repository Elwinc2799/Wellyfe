import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RateButton extends StatelessWidget {

  final VoidCallback function;

  const RateButton({Key? key, required this.function}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: function,
      child: Container(
        height: size.height * 0.05,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "Save",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: "NunitoSans",
              fontWeight: FontWeight.w700
            ),
          ),
        ),
      ),
    );
  }
}
