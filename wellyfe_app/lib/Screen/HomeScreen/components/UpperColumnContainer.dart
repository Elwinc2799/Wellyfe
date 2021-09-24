import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wellyfe_app/Core/Services/FirebaseData.dart';
import 'package:wellyfe_app/Screen/HomeScreen/components/ImageHolder.dart';
import 'package:wellyfe_app/Screen/UserProfileScreen/UserProfileScreen.dart';

class UpperColumnContainer extends StatelessWidget {
  const UpperColumnContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 75.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    FirebaseData.getAllSleepData(context);
                  },
                  child: Container(
                    height: 100,
                    width: 100,
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
                    child: ImageHolder(image: "assets/pictures/sleep.png"),
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                FirebaseData.getAllTaskScheduleData(context);
              },
              child: Container(
                height: 150,
                width: 150,
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
                child: ImageHolder(image: "assets/pictures/task.png"),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, PageTransition(
                  type: PageTransitionType.fade,
                  child: UserProfileScreen(),
                ));
              },
              child: Container(
                height: 100,
                width: 100,
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
                child: ImageHolder(image: "assets/pictures/user.png"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
