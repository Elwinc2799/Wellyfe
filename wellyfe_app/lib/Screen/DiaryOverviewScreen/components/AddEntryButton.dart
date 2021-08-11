import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wellyfe_app/Screen/DiaryAddNewEntryScreen/DiaryAddNewEntryScreen.dart';

class AddEntryButton extends StatefulWidget {
  @override
  _AddEntryButtonState createState() => _AddEntryButtonState();
}

class _AddEntryButtonState extends State<AddEntryButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return GestureDetector(
      onTap: () {
        Navigator.push(context, PageTransition(
          type: PageTransitionType.fade,
          child: DiaryAddNewEntryScreen(),
        ));
      },
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
            "Add new diary",
            style: TextStyle(
              fontSize: 25,
              fontFamily: "TitilliumWeb",
              color: Color(0XFF394D70),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
