import 'package:flutter/material.dart';
import 'package:wellyfe_app/constants.dart';

class SocialMediaIcon extends StatelessWidget {
  const SocialMediaIcon({
    Key? key,
    required this.function,
    required this.asset,
  }) : super(key: key);

  final VoidCallback function;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        onTap: function,
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: backgroundColor,
              boxShadow: [
                BoxShadow(
                    blurRadius: 5.0,
                    offset: Offset(-3, -3),
                    color: Colors.white
                ),
                BoxShadow(
                    blurRadius: 5.0,
                    offset: Offset(3, 3),
                    color: Colors.black.withOpacity(.25)
                )
              ]
          ),
          child: Container(
            child: Image(image: AssetImage(asset), width: 30, height: 30),
          ),
        ),
      ),
    );
  }
}