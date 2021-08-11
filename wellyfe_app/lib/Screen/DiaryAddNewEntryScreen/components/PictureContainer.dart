import 'package:flutter/material.dart';

class PictureContainer extends StatefulWidget {
  @override
  _PictureContainerState createState() => _PictureContainerState();
}

class _PictureContainerState extends State<PictureContainer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AnimatedContainer(
      height: size.height * 0.45,
      width: size.width,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      color: Colors.grey.shade300.withOpacity(0.75),
      child: Center(
        child: GestureDetector(
          onTap: () {},
          child: Container(
              height: 150,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey
              ),
              child: Image(image: AssetImage("assets/logo/plus.png"),)
          ),
        ),
      ),
    );
  }
}


