import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellyfe_app/Core/Data/RecommendedActivity.dart';

class ActivityRecommendationsMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Container(
        height: size.height * 0.2,
        child: Row(
          children: [
            for (var i = 0; i < RecommendedActivity.recommendedList.length; i++)
              Row(
                children: [
                  ActivityRecommendationsIndividual(
                    activity: RecommendedActivity.recommendedList[i].activity,
                    icon: RecommendedActivity.recommendedList[i].icon,
                    duration: RecommendedActivity.recommendedList[i].duration,
                  ),
                  SizedBox(width: size.width * 0.025),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class ActivityRecommendationsIndividual extends StatelessWidget {
  const ActivityRecommendationsIndividual({
    Key? key,
    required this.activity,
    required this.icon,
    required this.duration,
  }) : super(key: key);

  final String activity;
  final String icon;
  final String duration;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.165,
      width: size.width * 0.25,
      decoration: BoxDecoration(
          color: Color(0XFFF4F9FF),
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          boxShadow: [
            BoxShadow(
                blurRadius: 5.0,
                offset: Offset(-3, -3),
                color: Colors.grey.withOpacity(0.1)
            ),
            BoxShadow(
                blurRadius: 5.0,
                offset: Offset(3, 3),
                color: Colors.black.withOpacity(.25)
            )
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image(image: AssetImage(icon)),
              SizedBox(height: size.height * 0.01),
              Text(
                activity,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.5,
                  fontFamily: "NunitoSans",
                  color: Color(0XFF394D70),
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                duration,
                style: TextStyle(
                  fontSize: 22.5,
                  fontFamily: "NunitoSans",
                  color: Colors.black.withOpacity(0.3),
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
