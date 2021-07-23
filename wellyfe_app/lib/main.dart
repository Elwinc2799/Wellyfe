import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/SignIn/SignInScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wellyfe',
      home: SignInScreen(),
    );
  }
}