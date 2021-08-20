import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/HomeLoadingScreen/components/Body.dart';
import 'package:wellyfe_app/Screen/NoConnectionScreen/components/Body.dart';
import 'package:wellyfe_app/Screen/SignInScreen/components/Body.dart';
import 'package:wellyfe_app/constants.dart';

class SignInScreen extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
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
                  body: Body(),
                ),
              );
            },
          );
        }

        return Scaffold(
          body: LoadingBody(),
        );
      },
    );
  }
}
