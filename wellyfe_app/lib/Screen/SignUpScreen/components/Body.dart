import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/SignInScreen/components/AlreadyHaveAnAccount.dart';
import 'package:wellyfe_app/Screen/SignInScreen/components/OrDivider.dart';
import 'package:wellyfe_app/Screen/SignInScreen/components/SocialMediaIcon.dart';
import 'package:wellyfe_app/Screen/SignUpScreen/components/Background.dart';
import 'package:wellyfe_app/Screen/SignUpScreen/components/SignUpForm.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      children: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 100.0, 20.0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Always Caring. Always Here.",
              style: TextStyle(
                fontSize: 25,
                fontFamily: "NunitoSans",
                fontWeight: FontWeight.w400,
                color: Colors.black.withOpacity(.5)
              ),
            ),
            SizedBox(height: size.height * 0.005),
            Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 40,
                fontFamily: "NunitoSans",
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(.5)
              ),
            ),
            SizedBox(height: size.height * 0.05),
            SignUpForm(),
            SizedBox(height: size.height * 0.025),
            OrDivider(),
            SizedBox(height: size.height * 0.005),
            Padding(
              padding: const EdgeInsets.fromLTRB(100.0, 0, 100.0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SocialMediaIcon(
                    function: () {},
                    asset: "assets/logo/facebook.png",
                  ),
                  SocialMediaIcon(
                    function: () {},
                    asset: "assets/logo/google.png",
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.025),
            AlreadyHaveAnAccount(
              login: false,
              press: () { Navigator.pop(context); }
            ),
          ],
        ),
      )
    );
  }
}
