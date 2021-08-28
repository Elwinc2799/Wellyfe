import 'package:flutter/material.dart';

class TextNavigation extends StatelessWidget {
  const TextNavigation({
    Key? key,
    required this.text,
    required this.navigationTitle,
    required this.function,
  }) : super(key: key);

  final String text;
  final String navigationTitle;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: size.width * 0.4,
          child: Text(
            text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 20,
              fontFamily: "NunitoSans",
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          height: size.height * 0.0375,
          width: size.width * 0.3,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.white,
                  width: 2
              ),
              borderRadius: BorderRadius.circular(20)
          ),
          child: GestureDetector(
            onTap: () {},
            child: Center(
              child: Text(
                navigationTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17.5,
                  fontFamily: "NunitoSans",
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}