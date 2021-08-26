import 'package:flutter/material.dart';
import 'package:flutter_scatter/flutter_scatter.dart';
import 'package:wellyfe_app/Core/Model/WordCount.dart';
import 'package:wellyfe_app/Screen/DiaryOverviewScreen/components/Background.dart';
import 'package:wellyfe_app/Screen/DiaryWordCloudScreen/components/ScatterItem.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    WordCount.getCloudText();

    List<Widget> widgets = [];

    for (var i = WordCount.wordCloud.length - 2; i > WordCount.wordCloud.length / 5; i--) {
      widgets.add(
        ScatterItem(
          word: WordCount.wordCloud.keys.elementAt(i),
          size: WordCount.wordCloud.values.elementAt(i).toDouble(),
          rotate: i % 2 == 0
        )
      );
    }

    final size = MediaQuery.of(context).size;
    final ratio = size.width / size.height;

    return Background(
      children: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 100.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Word Cloud of Your Diary",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Montserrat",
                  color: Color(0XFF394D70),
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: size.height * 0.1),
              Scatter(
                fillGaps: true,
                delegate: ArchimedeanSpiralScatterDelegate(ratio: ratio),
                children: widgets,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
