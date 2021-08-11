import 'package:flutter/material.dart';

class FitnessOverviewIndividual extends StatelessWidget {
  const FitnessOverviewIndividual({
    Key? key,
    required this.title,
    required this.image,
    required this.firstData,
    required this.firstUnit,
    required this.firstPercentage,
    required this.secondData,
    required this.secondUnit,
    required this.secondPercentage,
    required this.firstColor,
    required this.secondColor,
    required this.function,
  }) : super(key: key);

  final String title;
  final String image;
  final String firstData;
  final String firstUnit;
  final double firstPercentage;
  final Color firstColor;
  final String secondData;
  final String secondUnit;
  final double secondPercentage;
  final Color secondColor;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: function,
      child: Container(
        height: size.height * 0.3,
        width: size.width * 0.4,
        decoration: BoxDecoration(
            color: Color(0XFFF4F9FF),
            borderRadius: BorderRadius.all(Radius.circular(40.0)),
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
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: "NunitoSans",
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Image(image: AssetImage(image))
                ],
              ),
              BarCategory(
                data: firstData,
                unit: firstUnit,
                percentage: firstPercentage,
                color: firstColor,
              ),
              BarCategory(
                data: secondData,
                unit: secondUnit,
                percentage: secondPercentage,
                color: secondColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BarCategory extends StatelessWidget {
  const BarCategory({
    Key? key,
    required this.data,
    required this.unit,
    required this.percentage,
    required this.color
  }) : super(key: key);

  final String data;
  final String unit;
  final double percentage;
  final Color color;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: size.height * 0.075,
                width: size.width * 0.0175,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.15),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 80 * percentage,
                  width: size.width * 0.0175,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: size.width * 0.05),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data,
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: "NunitoSans",
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                unit,
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: "NunitoSans",
                  color: Colors.grey.shade500.withOpacity(0.5),
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}