import 'package:flutter/material.dart';

class FoodContainerIndividual extends StatefulWidget {
  @override
  _FoodContainerIndividualState createState() => _FoodContainerIndividualState();

  const FoodContainerIndividual({
    Key? key,
    required this.food,
    required this.size,
    required this.radius,
  }) : super(key: key);

  final String food;
  final double size;
  final double radius;
}

class _FoodContainerIndividualState extends State<FoodContainerIndividual> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        height: widget.size,
        width: widget.size,
        decoration: BoxDecoration(
          color: Color(0XFFE7F0F9),
          borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
          boxShadow: [
            BoxShadow(
                blurRadius: 5.0,
                offset:selected ? Offset(3, 3) : Offset(-3, -3),
                color: Colors.white
            ),
            BoxShadow(
                blurRadius: 5.0,
                offset: selected ? Offset(-3, -3) : Offset(3, 3),
                color: Colors.black.withOpacity(.15)
            )
          ]
        ),
        child: Center(
          child: Text(
            widget.food,
            style: TextStyle(
              fontSize: 25,
              fontFamily: "NunitoSans",
              color: selected ? Color(0XFF394D70) : Colors.black.withOpacity(0.3),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

