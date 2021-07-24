import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:wellyfe_app/Core/Model/SignInModel.dart';
import 'package:wellyfe_app/Screen/SignIn/components/LoginButton.dart';
import 'package:wellyfe_app/constants.dart';

class Liquid extends StatelessWidget {
  const Liquid({
    Key? key,
    required AnimationController animationController,
    required bool isFlipped,
  }) : animationController = animationController, isFlipped = isFlipped, super(key: key);

  final AnimationController animationController;
  final bool isFlipped;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double height = 0.25;
    final model = Provider.of<SignInModel>(context);

    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 2000),
        curve: Curves.elasticOut,
        transform: Matrix4.identity()
          ..translate(0.0, isFlipped ? -model.openValue - 150 : model.openValue + 150),
        decoration: BoxDecoration(
          color: liquidColor,
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Transform(
              transform: Matrix4.identity()
                ..scale(1.0, isFlipped ? -1.0 : 1.0)
                ..translate(0.0, isFlipped ? -size.height * height * 2 + 50 : -size.height * height + 50),
              child: Lottie.asset(
                "assets/json/liquid.json",
                animate: false,
                controller: animationController,
                height: size.height * height,
                delegates: LottieDelegates(
                  values: [
                    ValueDelegate.color(
                      const ["**", "Rectangle 1", "Fill 1"],
                      value: liquidColor
                    ),
                    ValueDelegate.color(
                        const ["**", "Shape 1", "Fill 1"],
                        value: liquidColor
                    ),
                  ]
                )
              ),
            ),
            isFlipped
                ? SizedBox()
                : LoginButton(
                    size: size,
                    model: model,
                    animationController: animationController
                  ),
          ],
        ),
      ),
    );
  }
}


