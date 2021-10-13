import 'package:flutter/material.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({
    Key? key,
    required this.login,
    required this.press,
  }) : super(key: key);

  final bool login;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Don't have an account? " : "Already Have An Account? ",
          style: TextStyle(
            fontSize: 17.5,
            fontFamily: "NunitoSans",
            fontWeight: FontWeight.bold,
            color: Colors.grey[400],
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sign Up!" : "Sign In!",
            style: TextStyle(
              fontSize: 17.5,
              fontFamily: "NunitoSans",
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
        )
      ],
    );
  }
}
