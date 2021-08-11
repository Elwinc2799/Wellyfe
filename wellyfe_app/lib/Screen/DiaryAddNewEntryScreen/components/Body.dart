import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/DiaryAddNewEntryScreen/components/DiaryForm.dart';
import 'package:wellyfe_app/Screen/DiaryAddNewEntryScreen/components/PictureContainer.dart';
import 'package:wellyfe_app/Screen/DiaryAddNewEntryScreen/components/TopLevelBar.dart';
import 'package:wellyfe_app/Screen/DiaryOverviewScreen/components/Background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      children: Padding(
        padding: const EdgeInsets.symmetric(vertical: 75.0),
        child: Column(
          children: [
            TopLevelBar(),
            SizedBox(height: size.height * 0.03),
            Container(
              height: size.height * 0.775,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    PictureContainer(),
                    SizedBox(height: size.height * 0.03),
                    Center(
                      child: DiaryForm()
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}

