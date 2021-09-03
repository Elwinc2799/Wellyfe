import 'package:flutter/material.dart';
import 'package:wellyfe_app/Core/Model/Doctor.dart';

class Background extends StatelessWidget {
  const Background({
    Key? key,
    required this.children,
  }) : super(key: key);

  final Widget children;

  Future<bool> _onWillPop() async {
    Doctor.doctorDataList = [];
    return true;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              child: Image(
                image: AssetImage("assets/pictures/background2.png"),
                fit: BoxFit.cover,
              ),
            ),
            children,
          ],
        ),
      ),
    );
  }
}
