import 'package:flutter/material.dart';
import 'package:wellyfe_app/Screen/FitnessSecondGoalsScreen/components/DietContainerList.dart';

class DietContainer extends StatelessWidget {

  const DietContainer({
    Key? key,
    required this.diet,
  }) : super(key: key);

  final DietPlan diet;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
      child: Container(
        width: size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: size.height * 0.375,
              width: size.width * 0.5,
              decoration: BoxDecoration(
                  color: Color(0XFFF4F9FF),
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${diet.diet}\nDiet",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: "NunitoSans",
                      color: Color(0XFF394D70),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Text(
                      diet.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.5,
                        fontFamily: "NunitoSans",
                        color: Color(0XFF394D70),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                top: -10,
                child: Container(
                  width: size.width * 0.35,
                  child: Image(
                    image: AssetImage("assets/pictures/${diet.diet.toLowerCase()}.png"),
                    fit: BoxFit.contain,
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}