import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/FitnessIntakeOverviewScreen/components/MealsRadioClass.dart';


class MealsRadioItem extends StatefulWidget {
  @override
  _MealsRadioItemState createState() => _MealsRadioItemState();

  const MealsRadioItem({
    Key? key,
    required this.item
  }) : super(key: key);

  final MealsRadioClass item;
}

class _MealsRadioItemState extends State<MealsRadioItem> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AnimatedContainer(
      width: size.width * 0.35,
      height: size.height * 0.05,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: widget.item.isSelected ? Colors.blueAccent : Colors.transparent,
      ),
      child: Center(
        child: Text(
          widget.item.text,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: "NunitoSans",
              color: widget.item.isSelected ? Colors.white : Color(0XFF394D70),
              fontSize: 17.5
          ),
        ),
      ),
    );
  }
}
