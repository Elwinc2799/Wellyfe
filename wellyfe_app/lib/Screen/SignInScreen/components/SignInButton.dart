import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    Key? key,
    required this.function,
  }) : super(key: key);

  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: GestureDetector(
        onTap: function,
        child: Container(
          height: size.height * 0.04,
          width: size.width * 0.35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Color(0XFFFF27B0),
          ),
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

        ),

      ),
    );
  }
}