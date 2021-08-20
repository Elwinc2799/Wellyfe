import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:wellyfe_app/Screen/SignInScreen/components/TextFieldLabel.dart';
import 'package:wellyfe_app/Screen/SignUpScreen/components/SignUpButton.dart';
import 'package:wellyfe_app/constants.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Future<void> signUpUserWithEmail(String email, String password, String confirmPassword) async {
    bool userCreated = true;

    if (password == confirmPassword) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          showNotification("The password is too weak.");
        } else if (e.code == 'email-already-in-use') {
          showNotification("The email is already in use.");
        }

        userCreated = false;
      }

      if (userCreated) {
        Navigator.pop(context);
        showNotification("Your account has been created successfully.\nPlease sign in.");
      }
    } else {
      showNotification("Your password does not match.\nPlease try again.");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldLabel(label: "Email"),
          buildEmailFormField(),
          SizedBox(height: size.height * 0.025),
          TextFieldLabel(label: "Password"),
          buildPasswordFormField(),
          SizedBox(height: size.height * 0.025),
          TextFieldLabel(label: "Confirm Password"),
          buildConfirmPasswordFormField(),
          SizedBox(height: size.height * 0.05),
          SignUpButton(
            function: () {
              signUpUserWithEmail(_emailController.text, _passwordController.text, _confirmPasswordController.text);
            }
          ),
        ],
      ),
    );
  }

  ToastFuture showNotification(String content) {
    return showToast(
      content,
      context: context,
      animation: StyledToastAnimation.fade,
      reverseAnimation: StyledToastAnimation.fade,
      duration: Duration(seconds: 3),
      position: StyledToastPosition.center,
    );
  }

  Container buildPasswordFormField() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: buildNeumorphicTextField(),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Enter your password",
          hintStyle: TextStyle(fontFamily: "NunitoSans", fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black.withOpacity(.5)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: outlineBorder(),
          focusedBorder: outlineBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: NeumorphicIcon(Icons.scatter_plot_sharp, size: 40)
          ),
        ),
        style: TextStyle(
          fontFamily: "NunitoSans",
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.black.withOpacity(.5),
        ),
        obscureText: true,
        controller: _passwordController,
      ),
    );
  }

  Container buildConfirmPasswordFormField() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: buildNeumorphicTextField(),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Confirm your password",
          hintStyle: TextStyle(fontFamily: "NunitoSans", fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black.withOpacity(.5)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: outlineBorder(),
          focusedBorder: outlineBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: NeumorphicIcon(Icons.scatter_plot_sharp, size: 40)
          ),
        ),
        style: TextStyle(
          fontFamily: "NunitoSans",
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.black.withOpacity(.5),
        ),
        obscureText: true,
        controller: _confirmPasswordController,
      ),
    );
  }

  Container buildEmailFormField() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: buildNeumorphicTextField(),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Enter your email",
          hintStyle: TextStyle(fontFamily: "NunitoSans", fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black.withOpacity(.5)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: outlineBorder(),
          focusedBorder: outlineBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: NeumorphicIcon(Icons.person, size: 40),
          ),
        ),
        style: TextStyle(
          fontFamily: "NunitoSans",
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.black.withOpacity(.5),
        ),
        controller: _emailController,
      ),
    );
  }

  BoxDecoration buildNeumorphicTextField() {
    return BoxDecoration(
      color: Color(0xFFE6EBF2),
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      boxShadow: [
        BoxShadow(
          blurRadius: 5.0,
          offset: Offset(-3, -3),
          color: Colors.white.withOpacity(.7)
        ),
        BoxShadow(
          blurRadius: 5.0,
          offset: Offset(3, 3),
          color: Colors.black.withOpacity(.15)
        )
      ]
    );
  }
}

OutlineInputBorder outlineBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: backgroundColor),
    gapPadding: 10,
  );
}
