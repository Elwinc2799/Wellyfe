import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wellyfe_app/Screen/ScheduleOverviewScreen/components/Body.dart';

class ScheduleOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0XFFE9EEF2),
            statusBarIconBrightness: Brightness.dark
        ),
        toolbarHeight: 0,
        toolbarOpacity: 0,
        backgroundColor: Color(0XFFE9EEF2),
        elevation: 0,
      ),
      backgroundColor: Color(0XFFE9EEF2),
      body: Body(),
    );
  }
}
