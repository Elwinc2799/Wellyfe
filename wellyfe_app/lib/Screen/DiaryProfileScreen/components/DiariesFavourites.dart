import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellyfe_app/Core/Providers/DiaryProvider.dart';
import 'package:wellyfe_app/Screen/DiaryProfileScreen/components/DataTitle.dart';

class DiariesFavourites extends StatelessWidget {
  const DiariesFavourites({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.175,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Color(0XFFE5EBF2),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 7.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DataTitle(
              data: Provider.of<DiaryProvider>(context).diaryList.length.toString(),
              title: "ALL DIARIES",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7.5),
              child: VerticalDivider(
                thickness: 1.5,
                width: 0.5,
              ),
            ),
            DataTitle(
              data: Provider.of<DiaryProvider>(context).getFavourite().toString(),
              title: "FAVOURITES",
            ),
          ],
        ),
      ),
    );
  }
}