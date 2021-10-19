import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/TherapyCareOverviewScreen/components/ArticleContainerList.dart';
import 'package:wellyfe_app/Screen/TherapyCareOverviewScreen/components/SpecialistRecommendationContainer.dart';
import 'package:wellyfe_app/Screen/TherapyCareOverviewScreen/components/TopLevelBar.dart';
import 'package:wellyfe_app/Screen/TherapyCareOverviewScreen/components/Background.dart';
import 'package:wellyfe_app/Screen/TherapyCareOverviewScreen/components/UpcomingEventsContainer.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      children: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopLevelBar(),
            SizedBox(height: size.height * 0.01),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.5),
              child: Text(
                "Consultants",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: "NunitoSans",
                  color: Color(0XFF394D70),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.035),
            SpecialistRecommendationContainer(),
            SizedBox(height: size.height * 0.035),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.5),
              child: Text(
                "Upcoming Events",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: "NunitoSans",
                  color: Color(0XFF394D70),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.035),
            UpcomingEventsContainer(),
            SizedBox(height: size.height * 0.035),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.5),
              child: Text(
                "Articles",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: "NunitoSans",
                  color: Color(0XFF394D70),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.035),
            ArticleContainerList()






            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 17.5),
            //   child: Text(
            //     "Therapy Care",
            //     style: TextStyle(
            //       fontSize: 25,
            //       fontFamily: "NunitoSans",
            //       color: Color(0XFF394D70),
            //       fontWeight: FontWeight.w700,
            //     ),
            //   ),
            // ),
            // SizedBox(height: size.height * 0.035),
            // TherapyCareList()
          ],
        ),
      ),
    );
  }
}









