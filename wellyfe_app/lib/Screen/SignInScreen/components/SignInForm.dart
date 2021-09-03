import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellyfe_app/Screen/DailyMoodScreen/DailyMoodScreen.dart';
import 'package:wellyfe_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:wellyfe_app/Screen/PersonalQuestionnaireScreen/PersonalQuestionnaireScreen.dart';
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

    if (authenticated)
      isMoodRecorded();
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
        // child: PersonalQuestionnaireScreen()
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
          SizedBox(height: size.height * 0.05),
          SignInButton(
            function: () {
              signInUserWithEmail(_emailController.text, _passwordController.text);
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
