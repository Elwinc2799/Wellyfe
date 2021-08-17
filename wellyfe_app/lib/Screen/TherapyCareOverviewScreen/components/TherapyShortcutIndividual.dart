import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TherapyShortcutIndividual extends StatelessWidget {
  const TherapyShortcutIndividual({
    Key? key,
    required this.therapy,
    required this.length,
    required this.function,
  }) : super(key: key);

  final String therapy;
  final int length;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: function,
      child: Container(
        height: size.height * 0.2,
        width: size.width * 0.225,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Color(0XFFE5EBF2),
            boxShadow: [
              BoxShadow(
                  blurRadius: 5.0,
                  offset: Offset(-3, -3),
                  color: Colors.white
              ),
              BoxShadow(
                  blurRadius: 5.0,
                  offset: Offset(3, 3),
                  color: Colors.grey.withOpacity(.25)
              )
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage("assets/logo/$therapy.png")),
                SizedBox(height: 10),
                Text(
                  therapy + " Therapy",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "NunitoSans",
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}