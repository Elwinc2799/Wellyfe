import 'package:flutter/material.dart';
import 'package:wellyfe_app/Core/Model/RadioModel.dart';
import 'package:wellyfe_app/constants.dart';

class RadioItem extends StatelessWidget {
  final RadioModel _item;

  RadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      height: _item.isSelected ? size.height * 0.075 : size.height * 0.075,
      width: _item.isSelected ? size.width * 0.15 : size.width * 0.15,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color:  backgroundColor,
          boxShadow: [
            BoxShadow(
                blurRadius: 2.0,
                offset: _item.isSelected ? Offset(3, 3) : Offset(-3, -3),
                color: Colors.white
            ),
            BoxShadow(
                blurRadius: 2.0,
                offset: _item.isSelected ?  Offset(-3, -3) : Offset(3, 3),
                color: Colors.black.withOpacity(.15)
            )
          ]
      ),
      child: Center(
        child: Text(
          _item.buttonText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12.5,
            fontFamily: "NunitoSans",
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(.5)
          ),
        ),
      ),
    );
  }
}
