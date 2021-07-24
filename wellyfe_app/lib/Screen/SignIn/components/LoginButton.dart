import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:wellyfe_app/Core/Model/SignInModel.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.size,
    required this.model,
    required this.animationController,
  }) : super(key: key);

  final Size size;
  final SignInModel model;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.072,
      width: model.isOpening ? size.width * 0.25 : size.width * 0.13,
      child: NeumorphicButton(
        onPressed: () {
          model.openLiquidMenu(animationController);
        },
        style: NeumorphicStyle(
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
          depth: model.isOpening ? -10 : 10,
          lightSource: model.isOpening ? LightSource.topRight : LightSource.topLeft,
          color: model.isOpening ? Colors.white : Colors.grey[100],
        ),
        padding: const EdgeInsets.all(12.0),
        child: model.isOpening ? buildSignInText() : buildSignInIcon(),
      ),
    );
  }

  Icon buildSignInIcon() => Icon(
    Icons.bubble_chart_outlined,
    color: Colors.grey,
  );

  Container buildSignInText() {
    return Container(
        alignment: Alignment.center,
        child: NeumorphicText(
          "Sign In",
          style: NeumorphicStyle(
            depth: 10,
            color: Colors.grey,
          ),
          textStyle: NeumorphicTextStyle(
            fontSize: 20,
          )
        ),
      );
  }
}