import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/DiaryProfileScreen/components/DataTitle.dart';

class DiariesFavourites extends StatelessWidget {
  const DiariesFavourites({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.15,
      width: size.width * 0.8,
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DataTitle(
              data: "10",
              title: "ALL DIARIES",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: VerticalDivider(
                thickness: 1.5,
                width: 0.5,
              ),
            ),
            DataTitle(
              data: "0",
              title: "FAVOURITES",
            ),
          ],
        ),
      ),
    );
  }
}