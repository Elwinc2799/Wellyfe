import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/LiquidMenu/components/Liquid.dart';
import 'package:wellyfe_app/constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Liquid(
              isFlipped: true,
              animationController: _animationController,
            ),
            Liquid(
              isFlipped: false,
              animationController: _animationController,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 1000)
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
   super.dispose();
  }
}

