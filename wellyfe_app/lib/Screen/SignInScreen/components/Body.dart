import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:wellyfe_app/Screen/SignInScreen/components/AlreadyHaveAnAccount.dart';
import 'package:wellyfe_app/Screen/SignInScreen/components/OrDivider.dart';
import 'package:wellyfe_app/Screen/SignInScreen/components/SignInButton.dart';
import 'package:wellyfe_app/Screen/SignInScreen/components/SignInForm.dart';
import 'package:wellyfe_app/Screen/SignInScreen/components/SocialMediaIcon.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome to Wellyfe",
            style: TextStyle(
              fontSize: 25,
              fontFamily: "NunitoSans",
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(.5)
            ),
          ),
          SizedBox(height: size.height * 0.005),
          Text(
            "Sign In",
            style: TextStyle(
              fontSize: 40,
              fontFamily: "NunitoSans",
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: size.height * 0.05),
          SignInForm(),
          SizedBox(height: size.height * 0.025),
          Center(
            child: GestureDetector(
              onTap: () {},
              child: Text(
                "Forgot Password ?",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "NunitoSans",
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.025),
          SignInButton(),
          SizedBox(height: size.height * 0.025),
          OrDivider(),
          SizedBox(height: size.height * 0.0125),
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
                  asset: "assets/logo/apple.png",
                ),
                SocialMediaIcon(
                  function: () {},
                  asset: "assets/logo/google.png",
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.05),
          AlreadyHaveAnAccount(press: () {}),
        ],
      ),
    );
  }
}

