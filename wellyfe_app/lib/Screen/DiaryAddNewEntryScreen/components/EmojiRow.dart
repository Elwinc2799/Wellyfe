import 'package:flutter/material.dart';

class EmojiRow extends StatefulWidget {
  @override
  _EmojiRowState createState() => _EmojiRowState();
}

class _EmojiRowState extends State<EmojiRow> {
  bool favourite = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.075,
      width: size.width * 0.4,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image(image: AssetImage("assets/logo/happy.png")),
            GestureDetector(
              onTap: () {
                setState(() {
                  favourite = !favourite;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.bounceIn,
                child: favourite
                    ? Image(image: AssetImage("assets/logo/heartFilled.png"))
                    : Image(image: AssetImage("assets/logo/heart.png")),
              )
            ),
            Image(image: AssetImage("assets/logo/sunny.png")),
          ],
        ),
      ),
    );
  }
}
