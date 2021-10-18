import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wellyfe_app/Screen/HomeScreen/components/Body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0XFFF2F3F7),
            statusBarIconBrightness: Brightness.dark
        ),
        toolbarHeight: 0,
        toolbarOpacity: 0,
        backgroundColor: Color(0XFFF2F3F7),
        elevation: 0,
      ),
      backgroundColor: Color(0XFFF2F3F7),
      body: Body(),
    );
  }
}
