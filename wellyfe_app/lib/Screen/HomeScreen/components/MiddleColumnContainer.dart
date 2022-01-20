import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wellyfe_app/Core/Services/FirebaseData.dart';
import 'package:wellyfe_app/Screen/DiaryOverviewScreen/DiaryOverviewScreen.dart';
import 'package:wellyfe_app/Screen/FitnessManagementOverviewScreen/FitnessManagementOverviewScreen.dart';

import 'package:wellyfe_app/Screen/HomeScreen/components/ImageHolder.dart';

class MiddleColumnContainer extends StatelessWidget {
  const MiddleColumnContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              FirebaseData.getAllDoctorData();
              FirebaseData.getAllAppointmentData(context);
            },
            child: Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color(0XFFF2F3F7),
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
              child: ImageHolder(image: "assets/pictures/therapyCare.png"),
            ),
          ),
          GestureDetector(
            onTap: () {
             Navigator.push(context, PageTransition(
                type: PageTransitionType.fade,
                child: DiaryOverviewScreen(),
              ));
            },
            child: Container(
              height: 112.5,
              width: 112.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color(0XFFF2F3F7),
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
              child: ImageHolder(image: "assets/pictures/diary.png"),
            ),
          ),
          GestureDetector(
            onTap: () {
              FirebaseData.getAllMealsData();
              FirebaseData.getAllIngredients();
              Navigator.push(context, PageTransition(
                type: PageTransitionType.fade,
                child: FitnessManagementOverviewScreen(),
              ));
            },
            child: Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color(0XFFF2F3F7),
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
              child: ImageHolder(image: "assets/pictures/fitness.png"),
            ),
          )
        ],
      ),
    );
  }
}
