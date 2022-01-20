import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:wellyfe_app/Core/Services/PermissionHandler.dart';
import 'package:wellyfe_app/Screen/HomeLoadingScreen/components/Body.dart';
import 'package:wellyfe_app/Screen/NoConnectionScreen/components/Body.dart';
import 'package:wellyfe_app/Screen/SignInScreen/components/Body.dart';
import 'package:wellyfe_app/constants.dart';

class SignInScreen extends StatefulWidget {

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late int flag;

  void initState(){
    super.initState();
  }

  Future _initialization() async {
    await Firebase.initializeApp();
    bool result = await PermissionHandler.requestPermission();
    if (result) {
      flag = 1;
    }
    else {
      flag = 0;
      print("flag " + flag.toString());
      showNotification("Permission denied! Please allow the app to access the required permission.");
    }
    try {
      final result = await InternetAddress.lookup('firebase.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
      }
    } on SocketException catch (_) {
      flag = 2;
      print('not connected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization(),
      builder: (context, snapshot){
        if (snapshot.hasError) {
          print(snapshot.error);
          return Scaffold(
            body: NoConnectionBody(),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              return Builder(
                builder: (context) => Scaffold(
                  backgroundColor: backgroundColor,
                  body: flag == 1 ? Body() : flag == 0 ? Scaffold(body: LoadingBody()) : Scaffold(body: NoConnectionBody())
                ),
              );
            },
          );
        }
        return Scaffold(
          body: LoadingBody()
        );
      },
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
}
