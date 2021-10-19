import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellyfe_app/Screen/DailyMoodScreen/DailyMoodScreen.dart';
import 'package:wellyfe_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:wellyfe_app/Screen/SignInScreen/components/SignInButton.dart';
import 'package:wellyfe_app/Screen/SignInScreen/components/TextFieldLabel.dart';
import 'package:wellyfe_app/constants.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool _isFirstOpen = false;
  String lastOpenKey = "lastOpen";
  bool obscure = true;

  Future<void> signInUserWithEmail(String email, String password) async {
    bool authenticated = true;

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showNotification("User does not exist.\nPlease try again.");
      } else if (e.code == 'wrong-password') {
        showNotification("Wrong password.\nPlease try again.");
      } else if (e.code == 'invalid-email') {
        showNotification("Please enter a valid email.");
      }

      authenticated = false;
    }

    if (authenticated) {
      isMoodRecorded();
      _emailController.clear();
      _passwordController.clear();
    }
  }

  void isMoodRecorded() async {
    final SharedPreferences prefs = await _prefs;

    if (prefs.getString(lastOpenKey) == null) {
      prefs.setString(lastOpenKey, DateTime.now().day.toString());
      _isFirstOpen = true;
    }

    setState(() {
      _isFirstOpen = (prefs.getString(lastOpenKey))
          != DateTime.now().day.toString();
    });

    if (_isFirstOpen) {
      prefs.setString(lastOpenKey, DateTime.now().day.toString());
      Navigator.push(context, PageTransition(
        type: PageTransitionType.fade,
        child: DailyMoodScreen(),
      ));
    } else {
      Navigator.push(context, PageTransition(
        type: PageTransitionType.fade,
        child: HomeScreen(),
      ));
    }
  }

  @override
  void initState() {
    super.initState();
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
          SizedBox(height: size.height * 0.035),
          SignInButton(
            function: () => signInUserWithEmail(_emailController.text, _passwordController.text)
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

  Stack buildPasswordFormField() {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.width * 0.135,
          decoration: buildNeumorphicTextField(),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Enter your password",
              hintStyle: TextStyle(fontFamily: "NunitoSans", fontSize: 17.5, fontWeight: FontWeight.w700, color: Colors.black.withOpacity(.5)),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              enabledBorder: outlineBorder(),
              focusedBorder: outlineBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
            style: TextStyle(
              fontFamily: "NunitoSans",
              fontSize: 17.5,
              fontWeight: FontWeight.w700,
              color: Colors.black.withOpacity(.5),
            ),
            obscureText: obscure,
            controller: _passwordController,
          ),
        ),
        Positioned(
          top: 17.5,
          right: 15,
          child: GestureDetector(
            onTap: () => setState(() {
              obscure = !obscure;
            }),
            child: Icon(
              obscure ? Icons.visibility_rounded : Icons.visibility_off_rounded,
              color: Colors.black.withOpacity(0.25),
            ),
          ),
        )
      ],
    );
  }

  Container buildEmailFormField() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.width * 0.135,
      decoration: buildNeumorphicTextField(),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Enter your email",
          hintStyle: TextStyle(fontFamily: "NunitoSans", fontSize: 17.5, fontWeight: FontWeight.w700, color: Colors.black.withOpacity(.5)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: outlineBorder(),
          focusedBorder: outlineBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        ),
        style: TextStyle(
          fontFamily: "NunitoSans",
          fontSize: 17.5,
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
