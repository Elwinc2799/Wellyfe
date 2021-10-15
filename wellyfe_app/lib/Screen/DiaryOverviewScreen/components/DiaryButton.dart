import 'package:flutter/material.dart';

class DiaryButton extends StatefulWidget {
  @override
  _DiaryButtonState createState() => _DiaryButtonState();

  const DiaryButton({
    Key? key,
    required this.function,
    required this.title,
  }) : super(key: key);

  final VoidCallback function;
  final String title;
}

class _DiaryButtonState extends State<DiaryButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return GestureDetector(
      onTap: widget.function,
      child: Container(
        height: size.height * 0.05,
        width: size.width * 0.5,
        decoration: BoxDecoration(
          color: Color(0XFFE5EBF2),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          boxShadow: [
            BoxShadow(
                blurRadius: 5.0,
                offset: Offset(-3, -3),
                color: Colors.white
            ),
            BoxShadow(
                blurRadius: 5.0,
                offset: Offset(3, 3),
                color: Colors.black.withOpacity(.15)
            )
          ]
        ),
        child: Center(
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 16,
              fontFamily: "Montserrat",
              color: Color(0XFF394D70),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
