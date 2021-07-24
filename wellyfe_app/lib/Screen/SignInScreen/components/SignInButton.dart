import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        width: size.width * 0.50,
        child: NeumorphicButton(
          onPressed: () {},
          child: Center(
            child: Text(
              "Sign In",
              style: TextStyle(
                fontFamily: "NunitoSans",
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          style: NeumorphicStyle(
            shape: NeumorphicShape.concave,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(100)),
            color: Color(0XFFFF27B0),
            depth: 20,
          ),
        ),
      ),
    );
  }
}