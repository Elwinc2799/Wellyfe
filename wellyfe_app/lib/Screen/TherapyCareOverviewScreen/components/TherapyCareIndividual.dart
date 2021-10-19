import 'package:flutter/material.dart';

class TherapyCareIndividual extends StatelessWidget {
  const TherapyCareIndividual({
    Key? key,
    required this.function,
  }) : super(key: key);

  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(right: 35.0, top: 20),
      child: GestureDetector(
        onTap: function,
        child: Container(
          height: size.height * 0.18,
          width: size.width * 0.55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFFFFFFF).withOpacity(0.3),
                  Color(0xFFFFFFFF).withOpacity(0.2),
                ],
                stops: [
                  0.1,
                  1,
                ]
            ),
          ),
        ),
      ),
    );
  }
}