import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wellyfe_app/Screen/FitnessWeightManagementScreen/FitnessWeightManagementScreen.dart';

class TopLevelBar extends StatelessWidget {
  const TopLevelBar({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context, PageTransition(
                type: PageTransitionType.fade,
                child: FitnessWeightManagementScreen(),
              ));
            },
            child: Text(
              "Health Status",
              style: TextStyle(
                fontSize: 22.5,
                fontFamily: "NunitoSans",
                color: Colors.grey.withOpacity(0.5),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(width: size.width * 0.05),
          Container(
            height: 7.5,
            width: 7.5,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0XFF394D70)
            ),
          ),
          SizedBox(width: size.width * 0.025),
          GestureDetector(
            child: Text(
              "Activity",
              style: TextStyle(
                fontSize: 22.5,
                fontFamily: "NunitoSans",
                color: Color(0XFF394D70),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(width: size.width * 0.05),
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0XFFF4F9FF),
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
                  child: Center(
                      child: Image(image: AssetImage("assets/logo/menu.png"))
                  )
              )
          )
        ],
      ),
    );
  }
}
