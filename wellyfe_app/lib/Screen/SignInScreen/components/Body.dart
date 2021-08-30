import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wellyfe_app/Screen/ForgotPasswordScreen/ForgotPasswordScreen.dart';
import 'package:wellyfe_app/Screen/SignInScreen/components/AlreadyHaveAnAccount.dart';
import 'package:wellyfe_app/Screen/SignInScreen/components/Background.dart';
import 'package:wellyfe_app/Screen/SignInScreen/components/OrDivider.dart';
import 'package:wellyfe_app/Screen/SignInScreen/components/SignInForm.dart';
import 'package:wellyfe_app/Screen/SignInScreen/components/SocialMediaIcon.dart';
import 'package:wellyfe_app/Screen/SignUpScreen/SignUpScreen.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
              "Wellyfe,",
              style: TextStyle(
                fontSize: 25,
                fontFamily: "NunitoSans",
                fontWeight: FontWeight.w700,
                color: Colors.black.withOpacity(.5)
              ),
            ),
            SizedBox(height: size.height * 0.005),
            Text(
              "where care comes first.",
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: "NunitoSans",
                  fontWeight: FontWeight.w400,
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
                color: Colors.black.withOpacity(.5)
              ),
            ),
            SizedBox(height: size.height * 0.05),
            SignInForm(),
            SizedBox(height: size.height * 0.025),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, PageTransition(
                    type: PageTransitionType.fade,
                    child: ForgotPasswordScreen(),
                  ));
                },
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
            OrDivider(),
            SizedBox(height: size.height * 0.001),
            Padding(
              padding: const EdgeInsets.fromLTRB(150.0, 0, 150.0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SocialMediaIcon(
                    function: () {

                    },
                    asset: "assets/logo/facebook.png",
                  ),
                  SocialMediaIcon(
                    function: () {

                    },
                    asset: "assets/logo/google.png",
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.025),
            AlreadyHaveAnAccount(
                login: true,
                press: () {
                  Navigator.push(context, PageTransition(
                    type: PageTransitionType.fade,
                    child: SignUpScreen(),
                  ));
                }
            ),
          ],
        ),
      ),
    );
  }
}


