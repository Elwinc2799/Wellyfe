import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wellyfe_app/Screen/FitnessMealsScreen/FitnessMealsScreen.dart';

class MealsContainer extends StatelessWidget {

  const MealsContainer({
    Key? key,
    required this.category
  }) : super(key: key);


  final String category;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(left: 40.0),
      child: Container(
        height: size.height * 0.26,
        width: size.width,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(3, (index) =>
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, PageTransition(
                      type: PageTransitionType.fade,
                      child: FitnessMealsScreen(),
                    )),
                    child: Container(
                      height: size.height * 0.2,
                      width: size.width * 0.25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(20.0)
                          ),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(4, 4),
                                blurRadius: 4,
                                color: Colors.black.withOpacity(0.5)
                            )
                          ]
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                            Radius.circular(20.0)
                        ),
                        child: Image(
                            image: AssetImage("assets/pictures/${category.toLowerCase()}1.jpg"), fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                )
            ),
          ),
        ),
      ),
    );
  }
}