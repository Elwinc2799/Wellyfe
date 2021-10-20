import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/TherapyCareOverviewScreen/components/UpcomingEventsContainerIndividual.dart';

class UpcomingEventsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.3,
      width: size.width,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 400.0,
          autoPlay: true,
          viewportFraction: 1,
        ),
        items: [1,2,3,4,5].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return UpcomingEventsContainerIndividual();
            },
          );
        }).toList(),
      ),
    );
  }
}

